Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1Sa2FU-0002jx-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 12:04:56 +0200
Received: by wgbdr1 with SMTP id dr1so635965wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 02:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=S8nFGo3EbUc9mqI4e2mo9gwp2rR7cVaZXR18kQtKM0U=;
	b=kLlUmo5aKXwYpmBhFzW9abdVeaPpAhHyuno/Jdih4uJ+xvuVpno2Np49DImFoevunT
	Id7lE+LilsP6wBimwsNweiKu2Bd2bveGDMR9Yl1nqBO9/7xeIPdRn3N2NL9oSxjDOLUw
	4GNG8kN6ZXj+rPkVbXMcS60yV8Ut14N7xG8FEho71WjmHhIf+EhBOOUYWvkI9rX2NY0m
	zEyRITj9EZLIPWjyijTOav9lM7o+QBt4iMFbGzyG+p0BT56WDp4hciwOIuJLNOaN8l9p
	TBgNFrZQN+O4YphYq0pggV4lSGb4HK7DlLtITKuZMfH7YnMdMFkVWZ/fmwKMs+2P/H2T
	9Osg==
MIME-Version: 1.0
Received: by 10.216.193.166 with SMTP id k38mr13251830wen.200.1338458076958;
	Thu, 31 May 2012 02:54:36 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Thu, 31 May 2012 02:54:36 -0700 (PDT)
In-Reply-To: <CAGiJk9fTx-AdJ+hXc8T988_ZBhjOcdhS4JiT7at=h4aEA9erHw@mail.gmail.com>
References: <CAGiJk9coc2zTnkX0CoM+cM52CDMwvpSwUN4DjjYoyrHnn5jD7Q@mail.gmail.com>
	<jojofu$9ph$1@dough.gmane.org>
	<CAGiJk9fTx-AdJ+hXc8T988_ZBhjOcdhS4JiT7at=h4aEA9erHw@mail.gmail.com>
Date: Thu, 31 May 2012 11:54:36 +0200
Message-ID: <CAGiJk9c3354PMrEO2wDEmQsmA1dNtUs7z__EOFY8=1yRHE59jQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-kde] Status of the meta-kde layer
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
X-List-Received-Date: Thu, 31 May 2012 10:04:56 -0000
Content-Type: text/plain; charset=UTF-8

2012/5/25 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/5/11 Koen Kooi <koen@dominion.thruhere.net>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 11-05-12 12:44, Samuel Stirtzel schreef:
>>
>>> Testing meta-kde: Currently it won't work until you can provide
>>> soprano-native from your host or elsewhere. After this issue is resolved
>>> it will be easy to archive on OpenEmbedded if you use the branch
>>> sst-test-images:
>>> https://gitorious.org/openembedded-core-layers/meta-kde/trees/sst-test-images/recipes-images
>>>
>>>
>> *just talking to myself* Maybe it would be a good idea to have a git
>>> subtree providing the images, so parsing won't fail over
>>> "systemd-image.bb not found" on Poky?
>>
>> changing the 'require' to 'include' should get around that.
>
> Hi,
> this works good thanks for pointing that out.
> I merged the branch sst-test-images into master.
>
> The soprano-native recipe with the missing onto2vocabularyclass binary
> was added too.
> Testing this layer should be possible now.
>

Some screenshots of Plasma Active (Overo Gumstix Water armv7a Cortex-A8):

Plasma Active has a nice touch-interface based layout, on normal
screens (5:4 1280x1024) it looks a bit over sized:
https://docs.google.com/open?id=0Bx-m3uk1yDB-WnFxTkhyOVBkRU0

CPU is under heavy load, but it is entirely caused by the xserver (I'm
looking into that):
https://docs.google.com/open?id=0Bx-m3uk1yDB-QmlKRFRuRWxZMWs

(commits are not yet on gitorious)

--
Regards
Samuel


