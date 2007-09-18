Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IXiCB-0003ed-IW
	for openembedded-devel@openembedded.org; Tue, 18 Sep 2007 20:53:15 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8IInOxW024827 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2007 20:49:24 +0200
Message-ID: <46F01DC6.6000503@student.utwente.nl>
Date: Tue, 18 Sep 2007 20:49:42 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1190138099.46f010f33252b@imp.free.fr>
	<46F01466.4080000@dominion.kabel.utwente.nl>
In-Reply-To: <46F01466.4080000@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: fortran and octave
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
X-List-Received-Date: Tue, 18 Sep 2007 18:53:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Alain2210 schreef:
>> Hello,
>>
>> I would like to bitbake octave for org.openembedded.dev.
>> But octave needs fortran ou f2c.
>> It seems that fortran has been remove from gcc-cross_4.1.2.bb (or perhaps
>> before).
>> So I have tried to
>> 1) add fortran in gcc-cross_4.1.2.bb but I get an error.
>> 2) compile octave with f2c without success. (even with the f2c of the host)
>>
>> So what is the good way to compile octave and/or fortran and/or f2c ?
> 
> For gcc 3.4 through 4.1.x fortran is broken for arm (gcc ICEs on compiling gcc), Lennert
> Buytenhek had some patches for it, I don't know if they fix and and if yes, I don't know
> if they are in 4.2.1. I'm firing of a build of 4.2.1 with fortran enabled anyway :)

Same old, same old:

/media/hda4/OE/build/tmp-new/angstrom/work/armv5te-angstrom-linux-uclibcgnueabi/gcc-cross-4.2.1-r4/gcc-4.2.1/libgfortran/generated/_mod_i8.F90:
In function 'specific__mod_i8':
/media/hda4/OE/build/tmp-new/angstrom/work/armv5te-angstrom-linux-uclibcgnueabi/gcc-cross-4.2.1-r4/gcc-4.2.1/libgfortran/generated/_mod_i8.F90:42:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG8B3GMkyGM64RGpERAqU7AKCp1z6hELV18erP+dMbhPayd/GhxgCcDMcN
+3tocngg8sZuIC30inMy5SM=
=xCvQ
-----END PGP SIGNATURE-----


