Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IvBuh-0004kl-Rx
	for openembedded-devel@openembedded.org; Thu, 22 Nov 2007 14:16:15 +0100
Received: from bq8.dotserv.com (localhost [127.0.0.1])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAMDDtMG013731
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Nov 2007 14:13:55 +0100
Received: (from apache@localhost)
	by bq8.dotserv.com (8.13.1/8.13.1/Submit) id lAMDDtON013726;
	Thu, 22 Nov 2007 14:13:55 +0100
X-Authentication-Warning: bq8.dotserv.com: apache set sender to
	eha@doredevelopment.dk using -f
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Date: Thu, 22 Nov 2007 14:13:55 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
Organization: =?UTF-8?Q?Dor=C3=A9_Development_ApS?=
Message-ID: <c32c07735656d36bbcc79a3742607613@127.0.0.1>
X-Sender: eha@doredevelopment.dk
User-Agent: RoundCube Webmail/0.1b
Subject: Bitbake wrapper
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
X-List-Received-Date: Thu, 22 Nov 2007 13:16:16 -0000
X-Groupsio-MsgNum: 3414
Content-Type: multipart/mixed;
	boundary="=_6217b096a0c162d34d887bedd35240fd"

--=_6217b096a0c162d34d887bedd35240fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by bq8.dotserv.com id lAMDDtMG013731

Hi

For what it is worth, the attached bash script when placed
somewhere in PATH before bitbake make bitbake into a location
aware tool if not setup in any other way.

So if/when you want to have it behave as it does now, just
remember to setup PATH, BBPATH and so on and go on with your
business (as usual).

But if you don't setup variables in advance (for whatever reason),
just go into your build directory, or any subdir of that and do
your bitbake commands as before. You just have to place a file
called .bbenv in the top builddir that when sourced into your
shell (bash) setup BBPATH, PYTHONPATH, PATH and any additional
variables needed by your build.

Example .bbenv:

export OEDIR=3D"/stuff"
export BBPATH=3D"${OEDIR}/local:${OEDIR}/build/foo:${OEDIR}/openembedded"
export PYTHONPATH=3D"${OEDIR}/bitbake/libbitbake"
export PATH=3D"${OEDIR}/bitbake/bin:${PATH}"

AFAICS, it only adds functionality without removing any
capabilities for "power-users".

/Esben
--=20
Esben Haabendal
Embedded Software Consultant
Dor=C3=A9 Development ApS

--=_6217b096a0c162d34d887bedd35240fd
Content-Type: application/octet-stream; name="bitbake"
Content-Disposition: attachment; filename="bitbake"
Content-Transfer-Encoding: base64

IyEvYmluL3NoCgojIFdyYXBwZXIgZm9yIGJpdGJha2Ugd2hpY2ggaXMgc3VwcG9zZWQgdG8gYmUg
Y2FsbCB3aGVuIG5vIHNwZWNpZmljIE9FCiMgYnVpbGQgZW52aXJvbm1lbnQgaGF2ZSBiZWVuIGNv
bmZpZ3VyZWQKCiMgVG8gZ3VhcmQgYWdhaW5zdCBsb29wcywgJEJJVEJBS0VfV1JBUFBFRCBpcyBh
bHdheXMgc2V0CmlmIHRlc3QgeCR7QklUQkFLRV9XUkFQUEVEfSA9ICJ4eWVzIjsgdGhlbgoJZWNo
byAiV3JhcHBlciBsb29wIGRldGVjdGVkLiBBYm9ydGluZyEiCgllY2hvICJNYWtlIHN1cmUgdG8g
c2V0dXAgUEFUSCBpbiAuYmJlbnYgc28gdGhhdCB0aGUgcmVhbCBiaXRiYWtlIGNvbW1hbmQiCgll
Y2hvICJpcyBmb3VuZCBiZWZvcmUgdGhlIHdyYXBwZXIuIgpmaQpleHBvcnQgQklUQkFLRV9XUkFQ
UEVEPSJ5ZXMiCgojIFRyYXZlcnNlIGZyb20gJFBXRCB0byAvIHRvIGZpbmQgLmJiZW52IGZpbGUg
d2hpY2ggaXMgdGhlbiBzb3VyY2VkCiMgYW5kIHJlYWwgYml0YmFrZSBjb21tYW5kIGlzIGNhbGxl
ZApwYXRoPSRQV0QKd2hpbGUgdGVzdCAkcGF0aCAhPSAiLyIgOyBkbwoJYmJlbnY9IiR7cGF0aH0v
LmJiZW52IgoJaWYgdGVzdCAtZSAke2JiZW52fSA7IHRoZW4KCQllY2hvICJVc2luZyAke2JiZW52
fSIKCQkuICIke2JiZW52fSIKCQlleGVjIGJpdGJha2UgJCoKCWZpCglwYXRoPWBkaXJuYW1lICRw
YXRoYApkb25lCg==

--=_6217b096a0c162d34d887bedd35240fd--
