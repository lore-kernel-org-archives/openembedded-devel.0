Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kirtibr@gmail.com>) id 1MFlg2-0002tA-FF
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Jun 2009 11:06:58 +0200
Received: by gxk2 with SMTP id 2so4589937gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2009 01:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=yKRvpdbdhiY1nxIhCZvgybWbvqYSn/iJhWC0tkdevUE=;
	b=NIKrPaZxQAc0MzPWxgiRwbf8KfRcHbHspJPjsUmRh6jiNBWKxDB4aqruIET3LzGXD4
	LxXztSvb9z/FUOO54UtaNEQM51scq1qsF9NzVuidCSa/cye5NzwULT5L8Beckcp0Ejsb
	ItBwxufDGVyNsuEoHFPqBX2ze/RBiMbW75qEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=x+ydz5G0YsHBrxLTes/ij3vlOj4IxB4Q5hAo5+bBScGP6hFRSShRh63nsCLInX4JX2
	KVLIT5uf/c635x2BW7GzPtC+uBR+R6XzL7U5g0CpJu7mwrBmazw5NHpHYKyFYXGzphIQ
	SNp/WcIper/s7d3hfTI/IW5eZVkkoWKzXSVtA=
MIME-Version: 1.0
Received: by 10.151.149.4 with SMTP id b4mr10919688ybo.0.1244969810601; Sun, 
	14 Jun 2009 01:56:50 -0700 (PDT)
Date: Sun, 14 Jun 2009 14:26:50 +0530
Message-ID: <64d5b90a0906140156k1a1f6eeei6c1c51e327f64b04@mail.gmail.com>
From: Kirtika Ruchandani <kirtibr@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OpenSSL recipe Patch: Include the files not being shipped in any package
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
X-List-Received-Date: Sun, 14 Jun 2009 09:06:58 -0000
X-Groupsio-MsgNum: 11253
Content-Type: multipart/mixed; boundary=001517511ace51279d046c4b1f83

--001517511ace51279d046c4b1f83
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I have added a line to the recipe to include the openssl.cnf and ca.sh/ca.pl
files in the ${PN}.
Patch attached herewith for openssl_0.9.8j.bb
Regards,

-- 
Kirtika Ruchandani
Maemo GSoC studen
Sophomore, CS&E @ IIT-Madras
IRC: rkirti
http://rkirti.wordpress.com

--001517511ace51279d046c4b1f83
Content-Type: text/x-diff; charset=US-ASCII; name="openssl-cnf.patch"
Content-Disposition: attachment; filename="openssl-cnf.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fvxit21g0

ZGlmZiAtLWdpdCBvcGVuc3NsL29wZW5zc2xfMC45LjhqLmJiIG9wZW5zc2wvb3BlbnNzbF8wLjku
OGouYmIKaW5kZXggMjE0NTBkMi4uMzYxMDVjNSAxMDA2NDQKLS0tIG9wZW5zc2wvb3BlbnNzbF8w
LjkuOGouYmIKKysrIG9wZW5zc2wvb3BlbnNzbF8wLjkuOGouYmIKQEAgLTEyLDMgKzEyLDUgQEAg
U1JDX1VSSSArPSAiZmlsZTovL2NvbmZpZ3VyZS10YXJnZXRzLnBhdGNoO3BhdGNoPTEgXAogICAg
ICAgICAgICAgZmlsZTovL29lLWxkZmxhZ3MucGF0Y2g7cGF0Y2g9MSIKIAogUEFSQUxMRUxfTUFL
RSA9ICIiCisKK0ZJTEVTXyR7UE59ICs9ICIvdXNyL2xpYi9zc2wvKiIK

--001517511ace51279d046c4b1f83--
