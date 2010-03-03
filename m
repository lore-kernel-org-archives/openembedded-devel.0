Received: from mail-pz0-f196.google.com ([209.85.222.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NmwHg-00043D-1o
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 22:39:16 +0100
Received: by pzk34 with SMTP id 34so1360864pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 13:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=RSSBeilgne9D1wA7jBvBnLVaZZaZfjSXVyNY1Oa8c+A=;
	b=vT4lYYGAWcH7VrUblH5yYgF5j3YXo6ziuE77ClU+WMHVZ1CKnnyJE938hH+lW9JIji
	PQz+xcmD4puwUIxUDDhxEMKlTPdLCrI1eA1tOJDmY82mFN79GZJ6SOJitRx4lSkazDwN
	bH/gzjGLJz99TJzMIncprgc6QgPkfIy6KeTuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nnXcxDISHQ9gVAPWAIISlV8QDTgZMKJ54Ur51a7TMOKrRY1RiSlAc5/GrmeV0jZznO
	Y2vjQ4lemchK28AqeYN+pqXTVgZ/UV7YwDU/NTuxnPR+mcp5MSk9x83A9MPzLW8s+i04
	36/gGtZ1ETJA/lm86ErmuRUWoHOME2kdABRMw=
MIME-Version: 1.0
Received: by 10.142.55.18 with SMTP id d18mr4795112wfa.29.1267652179314; Wed, 
	03 Mar 2010 13:36:19 -0800 (PST)
In-Reply-To: <hml6l5$oj0$1@dough.gmane.org>
References: <hml6l5$oj0$1@dough.gmane.org>
Date: Thu, 4 Mar 2010 08:06:19 +1030
Message-ID: <6ec4247d1003031336t6e6c4c74tff38b528264a420d@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.196
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DL_DIR on nfs mount -> lockfile mayhem
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
X-List-Received-Date: Wed, 03 Mar 2010 21:39:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 3 March 2010 18:59, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> One of my coworkers ran out of diskspace again and decided to move his
> DL_DIR to the filer and access it over NFS. Now do_fetch just hangs for
> nearly everything and we can get it to continue after removing the
> lockfiles in DL_DIR manually, but that's not a good solution.
>
> I don't touch NFS with a bargepole, but my coworker insists it's a valid
> use-case :) So, is DL_DIR on nfs supported and if so, any clues why it
> could break with lockfiles?
>
> This is with bitbake 1.8 from git.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLjh3kMkyGM64RGpERAqZ0AJ9JlIjYNNApPue9ik+LsH4HBF1ACACfWsEi
> CC1SVf3BR0QtLsMyOakTKA0=
> =lGCK
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

What is the nfs server running and what are your mount options? I've
seen odd behaviour with applications using sqlite (e.g. firefox) on
some nfs mounts: http://www.sqlite.org/faq.html#q5

Does the problem go away when the filesystem is mounted -onolock ?

-Graham


