Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXoUG-0001Ox-H1
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 May 2012 08:59:00 +0200
Received: by wibhm14 with SMTP id hm14so505772wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3hxNEExxpnLOvnQYPsK9etL4MQ5EpooO36qSq1G12L0=;
	b=zbh2izF5ZeGpB4hJHdUtRJeRX6wLOFKc5wNNA3l8lwWdXGw6CJiEQbqJrwlCSy3hJ8
	MYSlVNn0zCY2AfYklT/vQwdpIbRbFRhqhkVDtpP5IRBGRv0dfDQxrif9rJVEjkx+9LLf
	8bcnRUS+N1A92TAsy6jfh2EyjoByweaQaDID4LK2ihT3iERO1IQAH8feBZw1u/6OUF82
	4I0XvjyRC9PTz37qElhWVPIxN34oFZ7+Is1iNdPmoafwueYlNoti9vJi3+b8RDh1X4tr
	/jyW8p1UTU8pZyCyurIq0pV6br1Ipd5X8xwWlo6K4JV88AUQvjgYLJhdJZzeaxCgWCy/
	lJmQ==
MIME-Version: 1.0
Received: by 10.216.214.155 with SMTP id c27mr1155199wep.116.1337928528503;
	Thu, 24 May 2012 23:48:48 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Thu, 24 May 2012 23:48:48 -0700 (PDT)
In-Reply-To: <jojofu$9ph$1@dough.gmane.org>
References: <CAGiJk9coc2zTnkX0CoM+cM52CDMwvpSwUN4DjjYoyrHnn5jD7Q@mail.gmail.com>
	<jojofu$9ph$1@dough.gmane.org>
Date: Fri, 25 May 2012 08:48:48 +0200
Message-ID: <CAGiJk9fTx-AdJ+hXc8T988_ZBhjOcdhS4JiT7at=h4aEA9erHw@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 May 2012 06:59:00 -0000
Content-Type: text/plain; charset=UTF-8

2012/5/11 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 11-05-12 12:44, Samuel Stirtzel schreef:
>
>> Testing meta-kde: Currently it won't work until you can provide
>> soprano-native from your host or elsewhere. After this issue is resolved
>> it will be easy to archive on OpenEmbedded if you use the branch
>> sst-test-images:
>> https://gitorious.org/openembedded-core-layers/meta-kde/trees/sst-test-images/recipes-images
>>
>>
> *just talking to myself* Maybe it would be a good idea to have a git
>> subtree providing the images, so parsing won't fail over
>> "systemd-image.bb not found" on Poky?
>
> changing the 'require' to 'include' should get around that.

Hi,
this works good thanks for pointing that out.
I merged the branch sst-test-images into master.

The soprano-native recipe with the missing onto2vocabularyclass binary
was added too.
Testing this layer should be possible now.

-- 
Regards
Samuel


