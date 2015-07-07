Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 145EA65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 00:17:28 +0000 (UTC)
Received: by igrv9 with SMTP id v9so165663838igr.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2015 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=93wzEKA3eOUlYXK0owP/hYxW47VEKKMSOQfNrs1TJ14=;
	b=Omaz6IyOLt0ppwiCObNgx61dkwYX8SxmWHMcnvdzorhb0poP7dQ8LWpUseF8R48uqT
	qd0u9l13KwuR7QV2q1wvXMjplXFdddd9zA7T31jPLbDtvsMeaT4CilejY1R9NKo4Qemo
	dqoBSktG3ap7Nyru2IVMcuApEZOGTXyt9+Kn7CDFkF1nKm+ZjGf8FMBlz1p/l4eyov/y
	o5Z+/bXIcYFy5x3BaCTvwN9UHuWDAawpgeOLFbtXg+cauAhQn3avpZEFjGZDFQ+JfgcC
	ZNd4OL9JgpHR4FJRlJ4/wC8bhKibHJcZNAaPuUryg/Jmjj/8KwxQA8XWDPsY2QVNzQgB
	0n8w==
X-Received: by 10.43.163.129 with SMTP id mo1mr36032446icc.61.1436228248581;
	Mon, 06 Jul 2015 17:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.78 with HTTP; Mon, 6 Jul 2015 17:16:59 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Mon, 6 Jul 2015 17:16:59 -0700
Message-ID: <CAK8F28m5vLYeFR1icyRiYfdX4uzvrLZ8V-s6=5hZEcMWCMBrBA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: SSL Certificate Path for Python
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
X-List-Received-Date: Tue, 07 Jul 2015 00:17:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

With the move from python 2.7.3 (dizzy) to 2.7.9 (fido), Python
actually validates SSL-transport for https URLs [1].  Python, by
default (i.e. no environment variable SSL_CERT_DIR set), looks for
certificates at '/usr/lib/ssl/certs'.  I tested this in a Python
shell:
import ssl
ssl.get_default_verify_paths()

The ca-certificates recipe seems to be installing certificates to
${D}${sysconfdir}/ssl/certs or /usr/share/ca-certificates/mozilla/
instead.  I think that Python will need a way to find the system's
certificates.  I can create a patch to do this but this seems to
couple the configuration in the ca-certificates and python recipes.

Has anyone stumbled across this issue?  Is there a standard way of
looking up where a system is storing its certificates?

[1] https://www.python.org/dev/peps/pep-0476/

Thanks for any insights---I'm learning much more about SSL
certificates than I expected today ;-).

--Ash

