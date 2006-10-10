Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <papercrane@gmail.com>) id 1GXQRM-00034g-JZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Oct 2006 00:51:12 +0200
Received: by py-out-1112.google.com with SMTP id i75so25384pye
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2006 15:44:59 -0700 (PDT)
Received: by 10.35.60.15 with SMTP id n15mr129826pyk;
	Tue, 10 Oct 2006 15:44:59 -0700 (PDT)
Received: by 10.35.118.16 with HTTP; Tue, 10 Oct 2006 15:44:59 -0700 (PDT)
Message-ID: <432beae0610101544g5f7bc4eco819ebbcb25f7f75d@mail.gmail.com>
Date: Tue, 10 Oct 2006 15:44:59 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>, 
	"Jamie Lenehan" <lenehan@twibble.org>, "Nicolas FR" <nicolasfr@gmail.com>
In-Reply-To: <20061010220601.GA20799@twibble.org>
MIME-Version: 1.0
References: <b9481e140610100631u25d9bc4dm7f6483c20e3c482d@mail.gmail.com>
	<20061010220601.GA20799@twibble.org>
Subject: Re: Bitbaking a recipe which refers to a missing bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2006 22:51:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/10/06, Jamie Lenehan <lenehan@twibble.org> wrote:
> On Tue, Oct 10, 2006 at 03:31:42PM +0200, "Nicolas FR" wrote:
> > Hi,
> >
> > I have noticed that when bitbaking a recipe which refers to a missing
> > .bbclass definition, there where no warning / error.
>
> I've noticed the same thing and I agree that it's rather annoying.
> I'd much rather it fail then continue on and do something else.
>

Try:

Index: lib/bb/parse/parse_py/BBHandler.py
===================================================================
--- lib/bb/parse/parse_py/BBHandler.py  (revision 618)
+++ lib/bb/parse/parse_py/BBHandler.py  (working copy)
@@ -62,7 +62,7 @@
         if not file in __inherit_cache.split():
             debug(2, "BB %s:%d: inheriting %s" % (fn, lineno, file))
             __inherit_cache += " %s" % file
-            include(fn, file, d)
+            include(fn, file, d, True)
     data.setVar('__inherit_cache', __inherit_cache, d)


This should show a big ERROR while parsing (but it doesn't bail, it
will just fail saying that there is no provider for this package as it
doesn't seem to make it into the cache now).

-- 
Justin Patrin


