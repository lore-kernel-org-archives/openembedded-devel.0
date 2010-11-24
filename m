Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PLJDu-0002Nj-FH
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 18:33:38 +0100
Received: by vws6 with SMTP id 6so2874114vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 09:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=922mEcJ1X+3pa+z0pRce9v6jEtbW3yfMbDkuszH+2eU=;
	b=AdmYFa8TpPCejmtpTaC2PWUbveDmSJMhtooLfwEuWnMIvg09vCPZHeueSxGYCd+C6P
	2eUa5Z2yOht+8emYEQhmw+TWTnedC7ukkhzaXFmu5ap4OCPDeMkmueVMkyMSY284RkJE
	zh3HGsHLvtyCtzVE5NIARe4vwA8gTSRzTUXog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=aGTins+CkfCFI+eHH/9zdCsBvqFx0u5QLV2hwNF8JbrqeP9piP79rZzIv49XYIoeux
	/GGHTr7nNVKZvEuKbRrTNBMjsGwYJOlqO++dJ5q2SldqtxcTLRL32Qcc+Q3Be8UYBZIb
	52S1tFP3lPFq0yBvdhXAtIjc41zgQu/sJTRLQ=
MIME-Version: 1.0
Received: by 10.216.235.41 with SMTP id t41mr2822115weq.55.1290619939406; Wed,
	24 Nov 2010 09:32:19 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.217.3.211 with HTTP; Wed, 24 Nov 2010 09:32:19 -0800 (PST)
Date: Wed, 24 Nov 2010 12:32:19 -0500
X-Google-Sender-Auth: FtQdGlwb0TemlgrYOYC2dUTKEm8
Message-ID: <AANLkTik7jiaQGPgnzi+AbygYSKsSTEY7jVPbk6CyRNAr@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails sanity check
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
X-List-Received-Date: Wed, 24 Nov 2010 17:33:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm seeing a new error using git HEAD and trying to build for the omapzoom2:


Build Configuration:
BB_VERSION        = "1.10.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "20117ec"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "omapzoom2"
DISTRO            = "angstrom"
DISTRO_VERSION    = "next"
TARGET_FPU        = "hard"

| checking how to run the C preprocessor... arm-angstrom-linux-gnueabi-gcc
-E
| configure: error: in
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/eglibc-2.12-r16.7+svnr11982/build-arm-angstrom-linux-gnueabi':
| configure: error: C preprocessor "arm-angstrom-linux-gnueabi-gcc -E" fails
sanity check
| See `config.log' for more details.
| ERROR: Function do_configure failed

Suggestions?  More info I can provide?


Thanks,
Zach Frey

