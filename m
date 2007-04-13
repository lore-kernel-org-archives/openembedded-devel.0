Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HcRR3-0002ug-Gy
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 21:27:53 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3DJRnLr029080 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2007 21:27:50 +0200
Message-ID: <461FD9AF.6050403@dominion.kabel.utwente.nl>
Date: Fri, 13 Apr 2007 21:27:43 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46176E51.2030608@dominion.kabel.utwente.nl>	<D93C49B4-4326-49E1-981A-C3EA65F49070@selfish.org>	<1176049069.5844.6.camel@localhost.localdomain>
	<200704110850.48209.openembedded@hrw.one.pl>
In-Reply-To: <200704110850.48209.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] rm_work
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
X-List-Received-Date: Fri, 13 Apr 2007 19:27:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:

> Maybe rm_work.bbclass should do:
> 
> BB_DEFAULT_TASK = "rm_work"
> addtask rm_work after do_build

This patch works for me:

koen@bitbake:~/OE/monotone/org.openembedded.dev$ mtn diff classes/rm_work.bbclass
#
# old_revision [59b29b63107f2448a7c5cb337360ab2aff6624e3]
#
# patch "classes/rm_work.bbclass"
#  from [00ead2158340f64f924a89c99a7b91b3a0a18c85]
#    to [6c2338de624467c193c7c1e9790b4ac7ed172ef4]
#
============================================================
- --- classes/rm_work.bbclass     00ead2158340f64f924a89c99a7b91b3a0a18c85
+++ classes/rm_work.bbclass     6c2338de624467c193c7c1e9790b4ac7ed172ef4
@@ -6,6 +6,9 @@
 # INHERIT += "rm_work"
 #

+BB_DEFAULT_TASK = "rm_work"
+addtask rm_work after do_build
+
 do_rm_work () {
     cd ${WORKDIR}
     for dir in *
@@ -18,5 +21,3 @@ do_rm_work () {
     done
 }

- -addtask rm_work before do_build
- -addtask rm_work after do_populate_staging
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGH9mvMkyGM64RGpERAnzVAJ4yyRXj1IExTxpuojspwrKoAxrmKgCcD0Ni
gPZAcEuVRyTDpJk13KShCis=
=tw4Q
-----END PGP SIGNATURE-----


