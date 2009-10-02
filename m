Received: from [76.96.30.24] (helo=QMTA02.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Mtilt-0000Tc-Ag
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Oct 2009 16:06:12 +0200
Received: from OMTA24.emeryville.ca.mail.comcast.net ([76.96.30.92])
	by QMTA02.emeryville.ca.mail.comcast.net with comcast
	id npUR1c00A1zF43QA2q5Puj; Fri, 02 Oct 2009 14:05:23 +0000
Received: from [192.168.1.101] ([67.188.141.116])
	by OMTA24.emeryville.ca.mail.comcast.net with comcast
	id nqA61c00G2WszPn8kqA6md; Fri, 02 Oct 2009 14:10:07 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Oct 2009 07:05:21 -0700
Message-Id: <1254492321.25385.5.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.24
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Message - Type Error exception
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
X-List-Received-Date: Fri, 02 Oct 2009 14:06:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I get the following message in the log file.

NOTE: Running task 367 of 2678 (ID:
1641, /home/ed/mini2440/OE/mini2440/recipes/python/python-native_2.6.1.bb, do_configure)
NOTE: Running task 368 of 2678 (ID:
2067, /home/ed/mini2440/OE/mini2440/recipes/libxml/libxml2-native_2.7.2.bb, do_setscene)
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
${@python_dir(d)}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
	EXTRA_LIBXML2_OECONF="\
	--with-python=${PYTHON_DIR} \
	--without-debug \
	--without-legacy \
	--with-catalog \
	--without-docbook \
	--with-c14n \
	"
	autotools_do_configure ${EXTRA_LIBXML2_OECONF}

NOTE: Running task 369 of 2678 (ID:
2068, /home/ed/mini2440/OE/mini2440/recipes/libxml/libxml2-native_2.7.2.bb, do_fetch)
NOTE: Running task 370 of 2678 (ID:
2069, /home/ed/mini2440/OE/mini2440/recipes/libxml/libxml2-native_2.7.2.bb, do_unpack)
NOTE: Unpacking ../sources/libxml2-2.7.2.tar.gz to
tmp/work/i686-linux/libxml2-native-2.7.2-r2/

Is this a problem?

Thanks
Ed



