Received: from [206.18.177.55] (helo=alnrmhc15.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HVwNn-0003vK-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Mar 2007 23:05:39 +0200
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (alnrmhc15) with ESMTP
	id <20070326210538b1500cgmd9e>; Mon, 26 Mar 2007 21:05:38 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 34E54D023; Mon, 26 Mar 2007 17:12:02 -0400 (EDT)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1174943520.1151@gatekeeper.stellarwerx.com>
In-Reply-To: <1848684762.20070325211238@gmail.com>
Date: Mon, 26 Mar 2007 17:12:00 -0400 (EDT)
MIME-Version: 1.0
Subject: Re: [RFC] Allow to limit generated binary locales topredefined list
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
X-List-Received-Date: Mon, 26 Mar 2007 21:05:41 -0000
Content-Type: multipart/mixed; boundary="bound1174943521"

--bound1174943521
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Paul:

This doesn't seem to be working for me.  I've tried:

GLIBC_GENERATE_LOCALES = "en_US en_US.UTF-8"

GLIBC_GENERATE_LOCALES = "en_US,ISO-8859-1 en_US.UTF-8,UTF-8"

GLIBC_GENERATE_LOCALES = "en_US ISO-8859-1,en_US.UTF-8 UTF-8"

in my local.conf file and it gives me this error:

ERROR: Error in executing: /OE/org.openembedded.dev/packages/glibc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to unpack
ERROR: Printing the environment of the function
ERROR:  0057:   # Collate the locales by base and encoding
ERROR:  0058:   encodings = {}
ERROR:  0059:   for l in supported:
ERROR:  0060:           l = l[:-1]
ERROR:  0061:           (locale, charset) = l.split(" ")
ERROR:  0062:           m = dot_re.match(locale)
ERROR:  0063:           if m:
ERROR:  0064:                   locale = m.group(1)
ERROR:  0065:           if not encodings.has_key(locale):
ERROR: Error in executing: /OE/org.openembedded.dev/packages/glibc/glibc_2.5.bb
ERROR: Exception:exceptions.ValueError Message:need more than 1 value to unpack
ERROR: Printing the environment of the function
ERROR:  0057:   if (bb.data.getVar('INHIBIT_PACKAGE_STRIP', d, 1) != '1'):
ERROR:  0058:           stripfunc = ""
ERROR:  0059:           for root, dirs, files in os.walk(dvar):
ERROR:  0060:                   for f in files:
ERROR:  0061:                           file = os.path.join(root, f)
ERROR:  0062:                           if not os.path.islink(file) and not os.path.isdir(file) and isexec(file):
ERROR:  0063:                                   stripfunc += "\trunstrip %s || st=1\n" % (file)
ERROR:  0064:           if not stripfunc == "":
ERROR:  0065:                   from bb import build

Do I need to use bitbake 1.8.x to get this to work??

Regards,
-Mark Gollahon


Paul Sokolovsky wrote ..
> Hello,
> 
> >  Binary locale generation for the entire locate set provided by GLIBC
> > takes noticeable amount of time (several hours).
> [...]
> >   The solution would be to allow to optionally constrain set of
> > generated locales to a predefined list.
> 
> > GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
> 
>   Committed.
> 
> 
> []
> 
> -- 
> Best regards,
>  Paul                            mailto:pmiscml@gmail.com
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bound1174943521--
