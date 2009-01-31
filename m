Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LT9nS-0005Oe-Ow
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 07:57:42 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LT9ft-0000fu-MZ
	for openembedded-devel@openembedded.org; Sat, 31 Jan 2009 00:49:53 -0600
Message-ID: <4983F48F.20208@dls.net>
Date: Sat, 31 Jan 2009 00:49:51 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: krb recipe
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
X-List-Received-Date: Sat, 31 Jan 2009 06:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

- This doesn't work.  First, I don't think the unpack belongs in do_configure, but be that as it may.  The big issue is that the patch creates a source file, which causes patching to fail because the source file already exists for any subsequent attempt to run do_configure.

do_configure() {
        tar xzf ${WORKDIR}/krb5-1.6.3.tar.gz -C ${WORKDIR}/
        patch -p1 < ${WORKDIR}/fix-uclibc-ruserpass-collision.patch
        oe_runconf
}



- do_configure failes if TARGET_LINK_HASH_STYLE is not set.  Right now it's only set for Angstrom distros, so this recipe only builds for Angstrom.  Note the extra space between "-O1" and "-lpthread" in the first line; something stripped extra white space as it was passed through somewhere.

configure: error: `LDFLAGS' has changed since the previous run:
configure:   former value:  -L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-rpath-link,/u/slug/slugos/\
tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-O1  -lpthread
configure:   current value: -L/u/slug/slugos/tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-rpath-link,/u/slug/slugos/\
tmp/staging/armv5teb-linux-gnueabi/usr/lib -Wl,-O1 -lpthread
configure: error: changes in the environment can compromise the build


Regards,
Mike (mwester)


