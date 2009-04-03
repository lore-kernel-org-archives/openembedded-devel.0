Received: from [130.89.2.14] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Lpars-0000oQ-K1
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 06:19:02 +0200
Received: from Powerbook-3.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id n334GKIS008748; 
	Fri, 3 Apr 2009 06:16:21 +0200
Message-ID: <49D58D93.20803@student.utwente.nl>
Date: Fri, 03 Apr 2009 06:16:19 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <6b7bf6e9-f3cb-4460-b1dc-312bc0ced19e@j18g2000prm.googlegroups.com>
In-Reply-To: <6b7bf6e9-f3cb-4460-b1dc-312bc0ced19e@j18g2000prm.googlegroups.com>
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.14
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: opkg-devel <opkg-devel@googlegroups.com>
Subject: Re: [RFC] opkg conffiles force overwrite
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
X-List-Received-Date: Fri, 03 Apr 2009 04:19:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-04-09 05:59, Tick wrote:
> Hi All,
>    I am pondering that let conf->force_overwrite in opkg enable
> resolve_conffiles overwrite any conffiles. Now opkg will not overwrite
> the conffiles even if you set force_overwrite. It will cause opkg ask
> user to choose what to do to the conffiles if they are changed.
>
> Adding another flag e.g. force_overwrite_conffile seems a little bit
> superfluous and not orthogonal to force_overwrite. But it will not
> change current opkg behavior.
>
> Letting force_overwrite can overwrite conffiles will cause logical
> change of this flag.  This will make opkg-cl asking nothing when
> upgrade some conffiles if you set force_overwrite. It may cause users
> lose their own setting without a second chance to save them?
>
> In my own opinion, I prefer let force_overwrite flag can overwrite
> files including conffiles, because it has to be set manually. But this
> will change the behaviour of opkg, and may have some impact on other
> projects. Such as OE. That makes me consider again and again.
>
> My proposal is if conffiles been overwrited because force_overwrite
> was set.
> The old conffile XXXX will be move to XXXX~, and adding a warning
> message of "overwriting conffile XXXX".
> Is that a good solution?

It's not a good solution since people use 'force-overwrite' to get 
around packages that don't (or can't) have RREPLACES set. If I do an 
opkg upgrade now, I don't want util-linux-ng-mount and busybox to start 
fighting over /etc/mountall, but I do want opkg to prompt me about fstab 
changes.

regards,

Koen


