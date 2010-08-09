Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OiYV9-0002NF-N0
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:59:17 +0200
Received: by qwg8 with SMTP id 8so7800413qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=1ua6uepFcZCAyVo1DTOx1EVIudVnrCFsFpMQMm7nnUI=;
	b=sXM6mmpXduLp5iQUzEOKQ4O0hzMGS9ZvcpqAPjC2p45OkJlAbmMS3VM7iw7cKsnj9y
	kaU1xU8QSdLPLXnEYm1VjB0Qral3LyNy760vE0dGOEjrOvWJL4WvRxH5JB4YF/A97YRz
	eaqFgnafY8kJqteL1c2wk/a2VQVtB091xgzvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=n6/3LyH13OQbofM2sG82de3X70dwN8UPCKJxEsD8DpRumgF7XR21volnRs6dvrYll8
	OdUkfEPX07OfAzp6kHl+mBgTmhI+uut3XjDsMXmhvYCS1mW8sg7vPjfkx2neRS4seBW4
	mnvY9E4htMFC6smvR9FvPgKGZOILwUaTmNKzs=
MIME-Version: 1.0
Received: by 10.224.54.13 with SMTP id o13mr8990577qag.228.1281383945148; Mon, 
	09 Aug 2010 12:59:05 -0700 (PDT)
Received: by 10.229.67.90 with HTTP; Mon, 9 Aug 2010 12:59:05 -0700 (PDT)
Date: Mon, 9 Aug 2010 14:59:05 -0500
Message-ID: <AANLkTimjiGEa47W9DiWyGawuQj7pTYdT-VSp4cVZ3tsJ@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: glibc-initial do_install failure
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
X-List-Received-Date: Mon, 09 Aug 2010 19:59:17 -0000
X-Groupsio-MsgNum: 22016
Content-Type: multipart/mixed; boundary=0015175cf80adf22be048d697246

--0015175cf80adf22be048d697246
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to build glibc-initial_2.3.6 for Microblaze arch
and it fails in do_install function at final stage when linking
libc.so; Error log attached

I notice that this always happends when invoking gcc with
"-shared" flag it always returns the same error:

/tmp/ccvUy8ol.o: could not read symbols: File format not recognized
| collect2: ld returned 1 exit status
| ERROR: Function do_install failed

The combination of tools that trying to build

binutils: 2.20.1
gcc:      4.5 Microblaze svn branch
glibc:    2.3.6 from petalogix know working port for microblaze
Computer host: Fedora 13

Can any one give me some advise on how to root cause and solve this problem?

Thanks in advance;

-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

--0015175cf80adf22be048d697246
Content-Type: text/x-log; charset=US-ASCII; name="glibc-initial_2.3.6.log"
Content-Disposition: attachment; filename="glibc-initial_2.3.6.log"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gcnqz2x60

bWljcm9ibGF6ZS1hbmdzdHJvbS1saW51eC1nY2MgLW1jcHU9djcuMzAuYSAvb3B0L29lL2J1aWxk
LW1pY3JvYmxhemUtZ2VuZXJpYy9jb25mL3RtcC93b3JrL21pY3JvYmxhemUtYW5nc3Ryb20tbGlu
dXgvZ2xpYmMtaW5pdGlhbC0yLjMuNi1yMzYuMC9idWlsZC1taWNyb2JsYXplLWFuZ3N0cm9tLWxp
bnV4L2NzdS9jcnRuLlMgLWMgIC1JLi4vaW5jbHVkZSAtSS4gLUkvb3B0L29lL2J1aWxkLW1pY3Jv
YmxhemUtZ2VuZXJpYy9jb25mL3RtcC93b3JrL21pY3JvYmxhemUtYW5nc3Ryb20tbGludXgvZ2xp
YmMtaW5pdGlhbC0yLjMuNi1yMzYuMC9idWlsZC1taWNyb2JsYXplLWFuZ3N0cm9tLWxpbnV4L2Nz
dSAtSS4uIC1JLi4vbGliaW8gIC1JL29wdC9vZS9idWlsZC1taWNyb2JsYXplLWdlbmVyaWMvY29u
Zi90bXAvd29yay9taWNyb2JsYXplLWFuZ3N0cm9tLWxpbnV4L2dsaWJjLWluaXRpYWwtMi4zLjYt
cjM2LjAvYnVpbGQtbWljcm9ibGF6ZS1hbmdzdHJvbS1saW51eCAtSS4uL3N5c2RlcHMvbWljcm9i
bGF6ZS9lbGYgLUkuLi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9taWNyb2JsYXplIC1JLi4vc3lz
ZGVwcy91bml4L3N5c3YvbGludXggLUkuLi9zeXNkZXBzL2dudSAtSS4uL3N5c2RlcHMvdW5peC9j
b21tb24gLUkuLi9zeXNkZXBzL3VuaXgvbW1hbiAtSS4uL3N5c2RlcHMvdW5peC9pbmV0IC1JLi4v
c3lzZGVwcy91bml4L3N5c3YgLUkuLi9zeXNkZXBzL3VuaXggLUkuLi9zeXNkZXBzL3Bvc2l4IC1J
Li4vc3lzZGVwcy9taWNyb2JsYXplIC1JLi4vc3lzZGVwcy93b3Jkc2l6ZS0zMiAtSS4uL3N5c2Rl
cHMvaWVlZTc1NC9mbHQtMzIgLUkuLi9zeXNkZXBzL2llZWU3NTQvZGJsLTY0IC1JLi4vc3lzZGVw
cy9pZWVlNzU0IC1JLi4vc3lzZGVwcy9nZW5lcmljL2VsZiAtSS4uL3N5c2RlcHMvZ2VuZXJpYyAt
bm9zdGRpbmMgLWlzeXN0ZW0gL29wdC9vZS9idWlsZC1taWNyb2JsYXplLWdlbmVyaWMvY29uZi90
bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzci9taWNyb2JsYXplL2xpYi9nY2MvbWljcm9ibGF6
ZS1hbmdzdHJvbS1saW51eC80LjUuMC9pbmNsdWRlIC1pc3lzdGVtIC9vcHQvb2UvYnVpbGQtbWlj
cm9ibGF6ZS1nZW5lcmljL2NvbmYvdG1wL3N5c3Jvb3RzL21pY3JvYmxhemUtYW5nc3Ryb20tbGlu
dXgvdXNyL2luY2x1ZGUgIC1pbmNsdWRlIC4uL2luY2x1ZGUvbGliYy1zeW1ib2xzLmggICAgICAg
LURIQVZFX0lOSVRGSU5JIC1EQVNTRU1CTEVSICAtSS9vcHQvb2UvYnVpbGQtbWljcm9ibGF6ZS1n
ZW5lcmljL2NvbmYvdG1wL3dvcmsvbWljcm9ibGF6ZS1hbmdzdHJvbS1saW51eC9nbGliYy1pbml0
aWFsLTIuMy42LXIzNi4wL2J1aWxkLW1pY3JvYmxhemUtYW5nc3Ryb20tbGludXgvY3N1Ly4gLWdn
ZGIzICAgLWcwICAtbyAvb3B0L29lL2J1aWxkLW1pY3JvYmxhemUtZ2VuZXJpYy9jb25mL3RtcC93
b3JrL21pY3JvYmxhemUtYW5nc3Ryb20tbGludXgvZ2xpYmMtaW5pdGlhbC0yLjMuNi1yMzYuMC9i
dWlsZC1taWNyb2JsYXplLWFuZ3N0cm9tLWxpbnV4L2NzdS9jcnRuLm8KfCBtYWtlWzJdOiBMZWF2
aW5nIGRpcmVjdG9yeSBgL29wdC9vZS9idWlsZC1taWNyb2JsYXplLWdlbmVyaWMvY29uZi90bXAv
d29yay9taWNyb2JsYXplLWFuZ3N0cm9tLWxpbnV4L2dsaWJjLWluaXRpYWwtMi4zLjYtcjM2LjAv
Z2xpYmMtMi4zLjYvY3N1Jwp8IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvb3B0L29lL2J1
aWxkLW1pY3JvYmxhemUtZ2VuZXJpYy9jb25mL3RtcC93b3JrL21pY3JvYmxhemUtYW5nc3Ryb20t
bGludXgvZ2xpYmMtaW5pdGlhbC0yLjMuNi1yMzYuMC9nbGliYy0yLjMuNicKfCAvdG1wL2NjdlV5
OG9sLm86IGNvdWxkIG5vdCByZWFkIHN5bWJvbHM6IEZpbGUgZm9ybWF0IG5vdCByZWNvZ25pemVk
CnwgY29sbGVjdDI6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKfCBFUlJPUjogRnVuY3Rpb24g
ZG9faW5zdGFsbCBmYWlsZWQKTk9URTogcGFja2FnZSBnbGliYy1pbml0aWFsLTIuMy42LXIzNi4w
OiB0YXNrIGRvX2luc3RhbGw6IEZhaWxlZApFUlJPUjogVGFza0ZhaWxlZCBldmVudCBleGNlcHRp
b24sIGFib3J0aW5nCkVSUk9SOiBCdWlsZCBvZiAvb3B0L29lL29wZW5lbWJlZGRlZC9yZWNpcGVz
L2dsaWJjL2dsaWJjLWluaXRpYWxfMi4zLjYuYmIgZG9faW5zdGFsbCBmYWlsZWQKRVJST1I6IFRh
c2sgMTQ1NSAoL29wdC9vZS9vcGVuZW1iZWRkZWQvcmVjaXBlcy9nbGliYy9nbGliYy1pbml0aWFs
XzIuMy42LmJiLCBkb19pbnN0YWxsKSBmYWlsZWQgd2l0aCAyNTYKRVJST1I6ICcvb3B0L29lL29w
ZW5lbWJlZGRlZC9yZWNpcGVzL2dsaWJjL2dsaWJjLWluaXRpYWxfMi4zLjYuYmInIGZhaWxlZApF
UlJPUjogJy9vcHQvb2Uvb3BlbmVtYmVkZGVkL3JlY2lwZXMvZ2xpYmMvZ2xpYmMtaW5pdGlhbF8y
LjMuNi5iYicgZmFpbGVkCg==

--0015175cf80adf22be048d697246--
