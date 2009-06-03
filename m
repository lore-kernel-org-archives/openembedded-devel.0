Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBt6D-0002Qz-AO
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 18:13:57 +0200
Received: (qmail 30726 invoked from network); 3 Jun 2009 16:04:59 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 3 Jun 2009 09:04:59 -0700
Date: Wed, 3 Jun 2009 09:04:58 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090603160458.GK26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 06/12] meta-toolchain-qte: initial qt embedded	toolchain version
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
X-List-Received-Date: Wed, 03 Jun 2009 16:13:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2009 at 06:37:16PM +0300, Ihar Hrachyshka wrote:

> +do_populate_sdk_append() {
> +       script = "${SDK_OUTPUT}/${prefix}/environment-setup"
> +       touch $script
> +       echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
> +       echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
> +       echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
> +       echo 'export OE_QMAKE_LIBDIR_QT=${prefix}/${TARGET_SYS}/${layout_libdir}' >> $script
> +       echo 'export OE_QMAKE_INCDIR_QT=${prefix}/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
> +       echo 'export OE_QMAKE_MOC=${prefix}/${layout_bindir}/moc4' >> $script
> +       echo 'export OE_QMAKE_UIC=${prefix}/${layout_bindir}/uic4' >> $script
> +
> +       # Repack SDK with new environment-setup
> +       cd ${SDK_OUTPUT}
> +       fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
> +}

I see two minor problems.  First, environment-setup is going to exist so
we don't need to touch it again.  In fact, the variable should still be
set, but for clarity we should just comment (in case the file gets
renamed to say environment-setup.sh (if we add in a *csh style one
too)).  Second, we should update, not recreate the tarball (tar -jf ...
--add-file=${prefix}/environment-setup, I think).

-- 
Tom Rini


