Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1PVfZ6-0004sR-PP
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 08:26:20 +0100
Received: by wyb40 with SMTP id 40so5926634wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=WfI3OZjfTW5lqqZHdLQe6/jBto4GXXRjSN5OEqOrXuc=;
	b=HOQwFZiMo7BWJ4Z9svmZj10f3WWk6GoJRB6HJWxTjLcIdTa/S3BFRcyOxCR4givaJ4
	31esFp8NmK1e0lEfCXHfNEX+jwd+x72AsVKonQZRfF1xuGaWyC8IVGNBmocn+FJPdrWR
	jwftkD1hqKMlCsvVMdD3xtr1oeZc/6p67xUX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=sAPDN6VzTXiu9LL8y47CxKxex5XRF0XMhjLZhG50hf4yMcrOKRJ9JnF0G/QzpspCix
	mDnjrica64yCijAu0qjesSCxuLc7hjtDTI0NRFjFtUW4x6pLQKPJ+3zck73LOMnPLOsS
	GFEmCxxNCTJTnLgVmskuPQZFjZ4oL2MarTTHk=
MIME-Version: 1.0
Received: by 10.216.82.20 with SMTP id n20mr8407028wee.107.1293089170559; Wed,
	22 Dec 2010 23:26:10 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Wed, 22 Dec 2010 23:26:10 -0800 (PST)
Date: Thu, 23 Dec 2010 18:26:10 +1100
X-Google-Sender-Auth: sioKhWcnQrO03GiLAbRkGXPSBGI
Message-ID: <AANLkTinhwtWJfCFLWdB_QFVMWBYZi1G_C6sPt-qCAL8n@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: QA issue with staging (workdir) for .la files in xmlrpc-c package
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
X-List-Received-Date: Thu, 23 Dec 2010 07:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi all

I'm having trouble building "xmlrpc-c", which I think is required for
rtorrent. It's failing at the "do_qa_staging" stage with the messages
such as "QA Issue with staging: libxmlrpc.la failed sanity test
(workdir)".

I gather the issue is that my sysroots/*/usr/lib/libxmlrpc.la file has
the following, which mentions the tmp/work/ directory:

# Libraries that this one depends upon.
dependency_libs=' -L.libs
-L/media/disk/home/vadmium/proj/aegle/build/tmp/work/armv7a-angstrom-linux-gnueabi/xmlrpc-c-1.06.41-r1/xmlrpc-c-1.06.41/src/../lib/libutil/.libs
-lxmlrpc_util -lxml2 -lz -lm'

So looks like another Libtool issue. But I'm stuck this time so if
anyone has any hints that would be awesome. For instance why does that
-L. . ./tmp/work/. . . component get there, and perhaps is there some
Libtool option to prevent or fix it?

I think the xmlrpc-c packages has its own version of Libtool (1.3.4?).
I tried coaxing the build process to use OE's Libtool version
(EXTRA_OEMAKE = "LIBTOOL='${HOST_SYS}-libtool'", after the import
line, in the recipe file), but this didn't seem to help.

Previously I thought I had another "QA issue" with this xmlrpc-c
package, something about a "hash style", which I thought I solved by
passing LADD='${LDFLAGS}' to the Make command. But recently when I
removed this change I am not getting the earlier "hash style QA
issue"; only this newer "workdir" one. But I may be confused.

-Martin

These are the full messages taken straight from log.do_qa_staging file
with awesome-long path names:

ERROR: QA Issue with staging: libxmlrpc.la failed sanity test
(workdir) in path
/media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
ERROR: QA Issue with staging: libxmlrpc_server_abyss.la failed sanity
test (workdir) in path
/media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
ERROR: QA Issue with staging: libxmlrpc_server.la failed sanity test
(workdir) in path
/media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
ERROR: QA Issue with staging: libxmlrpc_server_cgi.la failed sanity
test (workdir) in path
/media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
ERROR: QA Issue with staging: libxmlrpc_client.la failed sanity test
(workdir) in path
/media/disk/home/vadmium/proj/aegle/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
FATAL: QA staging was broken by the package built above


