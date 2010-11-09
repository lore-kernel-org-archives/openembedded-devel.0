Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PFgFY-0005i4-AD
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 05:56:06 +0100
Received: by yxe42 with SMTP id 42so4177449yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZZ5XfzJuWqhWUwpgp7Grqt+Au6FvJrRnvPAkGCy6S4E=;
	b=RuJsnrf6pZYmttyHtynFsUC2zqCJb4JgEQR2/0bclBVUX8K+rLK3/ZYeFBlbqZ6cEq
	s2+9fHdA/lkLsOX5h1zjfPw6Gqgcp6wEBJtIrcHyrVRwwOQNc4IQVxgS0ojh9rumykyk
	+5EC86cnQjxPsoxP2EfM7HgagJZJzCwJ34ooA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fEQGA32kg/UBzPpXjsLvrarql51WzVYZpf+sBA2M6nncEhRo64NclhyJDTYvvDrPOy
	Z37k3qlVzZxVAH7YtH8z075jIFD/1jXB46YaXyxaEwarbHDu7vhs+CJi2OICeMRIGxPi
	ozzel9KtJJ08lV+GTVK+7hotvMpgJ5P3+2Pxo=
Received: by 10.91.11.6 with SMTP id o6mr6415274agi.91.1289278462764; Mon, 08
	Nov 2010 20:54:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 8 Nov 2010 20:54:01 -0800 (PST)
In-Reply-To: <1865303E0DED764181A9D882DEF65FB67A65C6F4D5@shsmsx502.ccr.corp.intel.com>
References: <AANLkTikVxU787_ktH03HKBdCCFiGZOvxXk6pJ94+RK6Q@mail.gmail.com>
	<AANLkTikKbo9JQGzRMFjU+ud7QYkEZTMxc2PynO23SZV6@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB67A65C6F4D5@shsmsx502.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Nov 2010 20:54:01 -0800
Message-ID: <AANLkTinBZ84RJGik3f2mH3u6wmwwR3LLdHGQykzcHn5-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fail to build eglibc on testing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Nov 2010 04:56:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 8, 2010 at 7:00 PM, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> Chris Larson wrote:
>> On Mon, Nov 8, 2010 at 7:31 PM, Otavio Salvador
>> <otavio@ossystems.com.br>wrote:
>>
>>> I got this build fail. Anyone knows anything about it?
>>>
>>>> nscd.c:(.text+0x573): undefined reference to `__stack_chk_guard'
>>>> nscd.c:(.text+0x5cd): undefined reference to `__stack_chk_guard'
>>>>
>>> /home/otavio/hacking/ossystems/oe/oetmp-current/work/i586-oe-linux/egli=
bc-2.12-r15.6+svnr11762/build-i586-oe-linux/nscd/nscd.o:
>>> In function `parse_opt':
>>>> nscd.c:(.text+0x5fc): undefined reference to `__stack_chk_guard'
>>>> nscd.c:(.text+0x8cf): undefined reference to `__stack_chk_guard'
>>>
>>
>>
>> I've run into this before in the past. =C2=A0Never had time to
>> investigate, but throwing out a "me too" :)
>
> In Sep, when working on Poky side, I happened to meet with the same issue=
 (I think here it's the same issue.:-)
> In my Poky side, it turned out to be a gcc's with_build_sysroot configura=
tion issue:
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D366
> http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=3D2a066e7ca90a28d5=
681c5fa895a29e999ed7c88b
>
> Thought I worked on Poky for several months, I'm new to OE. I hope the ab=
ove links can help to fix your issue.
>

The fix is good. GCC assumes usr/include here which is wrong assumption whe=
n
dir structure is flattened out. However I would have preferred this
to be a patch instead  of a sed script. Let me fix it using a patch
instead for OE.

-Khem


