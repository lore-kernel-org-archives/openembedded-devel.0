Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jc7LC-0007xz-BN
	for openembedded-devel@openembedded.org; Thu, 20 Mar 2008 00:05:08 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jc6je-00009b-LM
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 22:26:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 22:26:14 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 22:26:14 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 23:26:04 +0100
Message-ID: <frs3tr$a48$1@ger.gmane.org>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
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
X-List-Received-Date: Wed, 19 Mar 2008 23:05:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
| Hi,
|
| Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
| should die. If we want packaged-staging and rm_work to function we
| need to fix them. Since we are all lazy we need some incentive:
|
| #
| # old_revision [85e676eb4b64d66cb74acf6220f10c3942e2bd29]
| #
| # patch "classes/insane.bbclass"
| #  from [0712df99743c442ed311e6b4d4be0d28f29d525f]
| #    to [fa6b704f402965c8123dfa90527b5a11a8cd3288]
| #
| ============================================================
| --- classes/insane.bbclass      0712df99743c442ed311e6b4d4be0d28f29d525f
| +++ classes/insane.bbclass      fa6b704f402965c8123dfa90527b5a11a8cd3288
| @@ -178,7 +178,7 @@ def package_qa_make_fatal_error(error_cl
|
|       TODO: Load a whitelist of known errors
|       """
| -    return not error_class in [0, 5, 7, 8]
| +    return not error_class in [0, 5, 7]
|
|   def package_qa_write_error(error_class, name, path, d):
|       """

I'm confident that the work done today catches the most used offenders,
so the patch has been pushed:

Commit by koen on org.oe.dev :: r0b604857... / :
insane bbclass: add '8' (.la references workdir) to list of fatal errors
this will also trigger on broken libtool archives already present in
staging. If you get hit by this: rebuild the offending recipes or do a
clean rebuild






-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4ZL7MkyGM64RGpERAre3AKCc7wXSp20R2o3QIeZt6CsVtgUcwwCcCt9G
4f6/cyes/PAY3Me99kqzdx8=
=40eF
-----END PGP SIGNATURE-----



