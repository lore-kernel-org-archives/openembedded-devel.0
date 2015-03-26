Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 249056013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6EB7E3151C17;
	Thu, 26 Mar 2015 20:16:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id T3fyHQaNWIV8; Thu, 26 Mar 2015 20:16:19 +0100 (CET)
Received: from [172.22.22.61] (55d4454e.access.ecotel.net [85.212.69.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 762433151842;
	Thu, 26 Mar 2015 20:16:19 +0100 (CET)
Message-ID: <55145B03.7070107@opendreambox.org>
Date: Thu, 26 Mar 2015 20:16:19 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: pyOpenSSL in meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Mar 2015 19:16:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Since version 0.14, pyOpenSSL has an unfulfilled runtime dependency on
python-cryptographic (which in turn depends on python-cffi,
python-enum34, python-pycparser) and python-six, and is therefore
unusable in its current state.

I've just submitted recipes for all but python-cryptographic, because I
couldn't get the latter to work.

Upstream bugs:
https://github.com/pyca/pyopenssl/issues/157
https://github.com/pyca/cryptography/issues/1325

I guess it would be easier to switch back to 0.13 and fix the compile
error that appeared with openssl 1.0.2, unless somebody else steps
forward to write a working recipe for python-cryptographic.

Btw, how about moving python-pyopenssl to meta-python? There's only one
recipe depending on it, which should IMHO be moved as well (gateone).

Regards,
Andreas

