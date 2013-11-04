Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 0A12F6CA7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 15:43:30 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 664C540016
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 15:15:23 +0100 (CET)
Message-ID: <5277C0A2.407@oss.bmw-carit.de>
Date: Mon, 04 Nov 2013 16:43:30 +0100
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
In-Reply-To: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
Subject: ruby-native problem (on dylan)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 15:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 10/04/2013 10:09 AM, Nicolas Dechesne wrote:
> hi,
>
> we got some build failures in our autobuilders last night, which
> seemed to be related to ruby-native. We use dylan, but I believe the
> same problem is there in master/dora too.
>
> The exact build error was in qtwebkit do_compile:
>
> ruby /mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_cloud/machines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-gnueabi/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb
> /mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_cloud/machines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-gnueabi/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScriptCore/llint/LowLevelInterpreter.asm
> LLIntDesiredOffsets.h
>
> <internal:gem_prelude>:1:in `require': cannot load such file --
> rubygems.rb (LoadError)
> from <internal:gem_prelude>:1:in `<compiled>'
>
> Yesterday I had 'moved' our BUILDDIR location. However for every build, we:
>   - delete the TMPDIR completely
>   - reuse our sstate
>
> The problem seems to be that 'ruby' has hard coded paths in the
> binary. This is discussed in [1] or more at length in [2], and easy to
> check:
>
> $ strings tmp/sysroots/x86_64-linux/usr/bin/ruby | grep project
> /work/project/build/tmp/sysroots/x86_64-linux/usr
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby/x86_64-linux
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby/x86_64-linux
> /work/project/build/tmp/sysroots/x86_64-linux/usr/share/rubygems
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/x86_64-linux
>
> So, the 'ruby' binary which was in the sstate, knew about the *old*
> paths. When building today, ruby was pulled from sstate, but TMPDIR
> has changed now, and the hardcoded paths no longer exists, leading to
> the build failure.
>
> I verified that the following 'solved' the build issue:
> $ bitbake -c cleansstate ruby-native
> $ bitbake ruby-native
> $ bitbake qtwebkit
>
> There seems to be a configure option, --enable-load-relative, after
> using this option in ruby build, still ruby fails to start for the
> same reason. I might have done something wrong, but i wanted to bring
> it on the list, to see if anyone has a better solution, as it seems
> like a big issue.
I saw the same issue in my setup and looked a bit deeper into it.
The patch "ruby-1.9.3-custom-rubygems-location.patch" seems to break 
--enable-load-relative.
When I remove this patch and add "--enable-load-relative" then ruby 
starts without an error. But this has the side effect that the rubygems 
directory is /usr/lib/ruby/rubygems instead of /usr/share/rubygems 
inside the sysroot. I don't know if this matters. Would it break 
anything else?
>
> thanks
>
> nicolas
>
>
> [1] http://stackoverflow.com/questions/10221387/moving-ruby-installation-causes-it-to-not-function-how-to-get-around-this
> [2] http://yehudakatz.com/2012/06/
>

Best Regards
Tobias

