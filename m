Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWV6v-00013g-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 12:15:10 +0100
Received: by wr-out-0506.google.com with SMTP id 57so1313782wri.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2008 03:13:48 -0800 (PST)
Received: by 10.100.93.19 with SMTP id q19mr2402927anb.4.1204629228171;
	Tue, 04 Mar 2008 03:13:48 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Tue, 4 Mar 2008 03:13:48 -0800 (PST)
Message-ID: <c384c5ea0803040313g4e5bc379oa54d245c19eb1b6e@mail.gmail.com>
Date: Tue, 4 Mar 2008 12:13:48 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1204485449.8223.36.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <c384c5ea0803020930s27303ee1q2719373db77fd8ba@mail.gmail.com>
	<1204485449.8223.36.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 64.233.184.234
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Multiple bitbake and a shared DL_DIR location - race conditions?
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
X-List-Received-Date: Tue, 04 Mar 2008 11:15:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard,

On Sun, Mar 2, 2008 at 8:17 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>  repository which would go to different files in DL_DIR but use the same
>  scm directory. One solution is to override SVNDIR/GITDIR/CVSDIR.
>
bitbake.conf:143:DL_DIR = "${TMPDIR}/downloads"
bitbake.conf:144:CVSDIR = "${DL_DIR}/cvs"
bitbake.conf:145:SVNDIR = "${DL_DIR}/svn"
bitbake.conf:146:GITDIR = "${DL_DIR}/git"

Can we change this into:

DL_DIR = "${TMPDIR}/downloads"
CO_DIR = "${DL_DIR}"
CVSDIR = "${CO_DIR}/cvs"
SVNDIR = "${CO_DIR}/svn"
GITDIR = "${CO_DIR}/git"

So that I can override CO_DIR robustly, even when a fourth revision
control system comes into play?

(CO_DIR as in checkout directory)

Regards,
-- 
Leon


