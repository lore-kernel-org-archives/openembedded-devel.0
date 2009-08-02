Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MXXUd-0008Ia-4p
	for openembedded-devel@openembedded.org; Sun, 02 Aug 2009 11:36:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MXXFj-0005uP-0R
	for openembedded-devel@openembedded.org; Sun, 02 Aug 2009 09:21:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 02 Aug 2009 09:21:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 02 Aug 2009 09:21:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 02 Aug 2009 11:21:03 +0200
Message-ID: <h53lpv$fm$1@ger.gmane.org>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>	<1244144325.6678.0.camel@port4>	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>	<1244206438.6643.46.camel@port4>	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>	<1244635240.28486.7.camel@hammer.suse.cz>	<20090730105711.GA29595@zlo.nu>	<1248952464.21030.110.camel@hammer.suse.cz>	<4A73D370.3050104@mwester.net>	<4A74ECAA.6020308@mwester.net>
	<4A750E80.2020704@mwester.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <4A750E80.2020704@mwester.net>
Sender: news <news@ger.gmane.org>
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks libtool's do_configure [PATCH]
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
X-List-Received-Date: Sun, 02 Aug 2009 09:36:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-08-09 05:56, Mike Westerhof wrote:
> Mike Westerhof wrote:
>> [top-posting] Any thoughts, anyone?  Should I revert the original change
>> (and the follow-on)?  Or is this unique to SlugOS again, and I should
>> add an override to the change?  Or might anyone who knows libtool and
>> libltdl have any suggestions on where to look?  It would even be helpful
>> if anyone else can tell me if libgphoto2 and pulseaudio build correctly
>> for their distro!
>
> And I think the answer is no, it doesn't build correctly for anybody.
>   The following line seems to be incorrect in the original patch:
>
> +               export ac_cv_path_SED=${ac_cv_path_GREP=/bin/sed}


Changing that fixes, will push a fix later today. Turns one to be one of 
the easier libtool problems to fix :)

regards,

Koen



