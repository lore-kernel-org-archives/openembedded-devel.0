Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IO9Es-0007aS-Oh
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 11:44:30 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 438C528C013; Thu, 23 Aug 2007 11:40:26 +0200 (CEST)
X-Spam-Flag: YES
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RCVD_IN_XBL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
X-Spam-Report: * -2.6 BAYES_00 BODY: Bayesian spam probability is 0 to 1%
	*      [score: 0.0000]
	* 2.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
	address *      [85.180.189.163 listed in dnsbl.sorbs.net]
	*  3.9 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  1.9 RCVD_IN_NJABL_DUL RBL: NJABL: dialup sender did non-local SMTP
	*      [85.180.189.163 listed in combined.njabl.org]
	*  0.0 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  2.6 REPTO_OVERQUOTE_THEBAT The Bat! doesn't do quoting like this
	* -2.1 AWL AWL: From: address is in the auto white-list
Received: from PROMETHEUS (e180189163.adsl.alicedsl.de [85.180.189.163])
	by srv043.dedi23.de (Postfix) with ESMTP id 54DB928C012
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 11:40:24 +0200 (CEST)
Date: Thu, 23 Aug 2007 11:43:19 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <476545512.20070823114319@vanille-media.de>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <46CD5539.9060701@dominion.kabel.utwente.nl>
References: <717ce6e40708230037r2bdd44f3v83180c286fbdd63c@mail.gmail.com>
	<46CD5062.5050308@whitby.id.au>
	<948196528.20070823112701@vanille-media.de>
	<46CD5539.9060701@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: 2007.2 compilation failed with package uicmoc4-native-4.0.3
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
X-List-Received-Date: Thu, 23 Aug 2007 09:44:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> mickeyl@linuxtogo.org schreef:
>> From OpenMoko-community:
>> 
>> Rod Whitby wrote:
>>> Phani Kumar Kancharala wrote:
>>>>  Hi all,  
>>>>     I followed the steps in wiki-openmoko to get openmoko on my pc
>>>> running Ubuntu 7.04 Feisty Fwan. Finally I also ended up with the same
>>>> error reported by *Frank Gau, *following are the error and logs given by
>>>> the mokomakefile:
>>>>
>>>> | kernel/qapplication_x11.cpp:89:31: error: X11/extensions/XI.h: No such
>>>> file or directory
>> 
>>> Install the host software package which provides the XI.h file.
>> 
>>> It'll be some X11 extensions development package.
>> 
>>> Then update the OEAndYourDistro page on the openembedded wiki to
>>> highlight that package as a requirement for your host distro.
>> 
>> Hmm, since when is uicmoc-native requiring X? If I recall correctly, I
>> had always chosen to build the respective -embedded variant of Qt to
>> not impose the need of having X on the build machine. It looks like we
>> are now building qt-x11 as provider for uicmoc4. Why did we change that?

> Because we needed the one from 4.3 which only has an x11 variant.

Nah, Qt/Embedded is still there -- they just uploaded it under a wrong
name to their ftp server:

ftp.trolltech.com/pub/qt/source/qtopia-core-opensource-src-4.3.0.tar.gz

I'd really like to see this X requirement on the build machine being removed.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



