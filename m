Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SOYXd-0003ou-CP
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 20:08:13 +0200
Received: by wgbdr1 with SMTP id dr1so1824128wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 10:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pQ14v9lxUzVDlZbXL9V2bSbhQ/9BsK36WfjIBRr3Lnw=;
	b=SQImdpWWJ0vuV/FEiFrl1IjMqAXvH+dPDCpHU1OPNwbYjmWD9/cVCvWCzKlxZIsuXi
	m0u1T/VBiLLQMQSRlvG0rqo/0suWm6mDZD65hN2ue0HJjThzkJLUgcbmaeK060YAKlvp
	JUFlp6EJsmXts+RiZv1a9laxIWrRnY/jp1Xlb1m8pGh46HK2M6b07Whk6DrIlsnxWLPf
	UAQB8k5OWfikznVdY16WbuUtlX/srT+yxXPLlLFryEYvfsrm9uL5lTb+Q6+zk0d4dz2L
	5opyw2+cyCB649Mj9aMIRbOSsUaok4Ok86gAALwYYvWnMoJDFL8fFFSyAGWoaeYYYK2h
	vArQ==
Received: by 10.180.94.7 with SMTP id cy7mr25965578wib.3.1335722312579;
	Sun, 29 Apr 2012 10:58:32 -0700 (PDT)
Received: from [192.168.1.33] (29.Red-83-60-182.dynamicIP.rima-tde.net.
	[83.60.182.29])
	by mx.google.com with ESMTPS id ff2sm35490187wib.9.2012.04.29.10.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 10:58:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
Date: Sun, 29 Apr 2012 19:58:29 +0200
Message-Id: <7FE6F435-C82E-43C1-B0F9-B5FC4E8EC1AC@gmail.com>
References: <92932941-A66D-45AF-8CDC-8F56D66C4E02@gmail.com>
	<CAMKF1soQ+eShsN+r5ZPA60vSEmEKZmKCM-WTt0mhghVUAteOUg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1257)
Subject: Re: gcc-4.4.1 assembler error: offset out of range
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
X-List-Received-Date: Sun, 29 Apr 2012 18:08:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Raj,

On Apr 29, 2012, at 7:15 PM, Khem Raj wrote:

> You have to post the assembly output that assembler is rejecting here
> for further details

The assembler output is generated into the /tmp folder, and it =
disappears
immediately afterwards, as soon as OE stops. How do I catch it? ;-)

> Anyhow, when you are changing from 4.3.3 why to 4.4.1 and not 4.5 that
> has been in OE for long and is default compiler for many OE based
> distributions out there

I want to do some specific tests with compiling RTI DDS 4.5f, whose =
libraries
have been compiled using gcc-4.4.1. This is the reason that I tried =
first with
gcc-4.4.1.

I've now cleaned up my overo-oe/tmp folder, and am in the process of =
trying to build
gcc-4.5, just to see if that works, but I will need to revert back to =
gcc-4.4.1
and fix this issue.

Best regards,

Elvis Dowson=


