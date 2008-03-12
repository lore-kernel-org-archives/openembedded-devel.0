Received: from [72.14.204.227] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1JZR6X-000704-0o
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 14:34:54 +0100
Received: by qb-out-0506.google.com with SMTP id p30so2581960qba.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 06:32:45 -0700 (PDT)
Received: by 10.115.77.1 with SMTP id e1mr6966730wal.103.1205328764255;
	Wed, 12 Mar 2008 06:32:44 -0700 (PDT)
Received: by 10.114.147.11 with HTTP; Wed, 12 Mar 2008 06:32:44 -0700 (PDT)
Message-ID: <bdb0025f0803120632s5372c9e7ycd037b464ab49141@mail.gmail.com>
Date: Wed, 12 Mar 2008 10:32:44 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <74d0deb30803120216y65be1b2cmaaaa9b2acf98ecee@mail.gmail.com>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org>
	<74d0deb30803120216y65be1b2cmaaaa9b2acf98ecee@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.14.204.227
X-SA-Exim-Mail-From: rodrigo.vivi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 13:34:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>  What is still unclear to me is how well a shared git repository with
>  push access for multiple parties is going to work. The mobile-linux
>  repository on serenity had some kind of permission trouble before we
>  added the group permission fixup in the post-update hook.

Very well. We have a Mamona git repository and each developer has
published their own repositories (sometimes with push access) and it
works fine. Using git remote you can add others branches fetching
pulling and pushing on them through http or ssh. For this you can
create a published branch your publish master and create another
branch to work on...
Git multiple branches is so amazing... It has almost no cost to create
or switch branches... Furthermore you can switch to a remote branch
and see your cowork branch as well use it to do a OE build.
And once more: git fetch and branch switch are *so fast*.

Cheers
vivijim

>  regards
>  Philipp
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


