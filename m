Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZK6j-0006Nj-LL for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:15:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZK4T-0007G8-A6
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:13:17 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:13:17 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 09:13:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 25 Jan 2010 09:12:48 +0100
Message-ID: <hjjjq0$r8l$1@ger.gmane.org>
References: <1264356995.3663.11.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <1264356995.3663.11.camel@mattotaupa>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [server] Which Patchwork do we run?
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
X-List-Received-Date: Mon, 25 Jan 2010 08:15:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-10 19:16, Paul Menzel wrote:
> Dear OE administrators,
> 
> 
> before I want to contact the Patchwork guys about some issues I am
> seeing, what version do we run.

Yesterday we were running this:

- From e7b2910d415f9bbba3cd7b7ab1b720bce54a86c6 Mon Sep 17 00:00:00 2001
From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 27 Feb 2009 17:31:02 +1100
Subject: [PATCH] docs: remove completed todo items

And now we are running:

- From d5edf740c9c2c31fa60c757aa8d66e1dedbab74a Mon Sep 17 00:00:00 2001
From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Sun, 24 Jan 2010 21:06:57 +0100
Subject: [PATCH] pwclient get: fix for handling messages encoded in UTF-8

regards,

Koen


> 
> It does not seem to be up to date judging from the differences in
> `pwclient`. 
> 
>         $ diff -u patchwork/apps/patchwork/bin/pwclient /usr/local/bin/pwclient 
>         --- patchwork/apps/patchwork/bin/pwclient	2010-01-24 19:12:26.000000000 +0100
>         +++ /usr/local/bin/pwclient	2010-01-23 22:30:53.000000000 +0100
>         @@ -285,14 +285,8 @@
>              if not success:
>                  sys.stderr.write("Patch not updated\n")
>          
>         -def patch_id_from_hash(rpc, project, hash):
>         -    try:
>         -        patch = rpc.patch_get_by_project_hash(project, hash)
>         -    except xmlrpclib.Fault:
>         -        # the server may not have the newer patch_get_by_project_hash function,
>         -        # so fall back to hash-only.
>         -        patch = rpc.patch_get_by_hash(hash)
>         -
>         +def patch_id_from_hash(rpc, hash):
>         +    patch = rpc.patch_get_by_hash(hash)
>              if patch == {}:
>                  return None
>          
>         @@ -388,9 +382,9 @@
>          
>              patch_id = None
>              if hash_str:
>         -        patch_id = patch_id_from_hash(rpc, project_str, hash_str)
>         +        patch_id = patch_id_from_hash(rpc, hash_str)
>                  if patch_id is None:
>         -            sys.stderr.write("No patch has the hash provided\n")
>         +            sys.stderr.write("No patch has the hash provided")
>                      sys.exit(1)
>          
>          
>         @@ -414,7 +408,7 @@
>          
>                  s = rpc.patch_get_mbox(patch_id)
>                  if len(s) > 0:
>         -            print unicode(s).encode("utf-8")
>         +            print s
>          
>              elif action == 'get' or action == 'save':
>                  try:
> 
> 
> Thanks a lot,
> 
> Paul
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXVJ/MkyGM64RGpERAqbIAKCR8HLXrSEbA6lnyjF4DTGNsbaIXwCfW1QR
x47sBzhJC6hqkSdVntpHmf0=
=26tU
-----END PGP SIGNATURE-----



