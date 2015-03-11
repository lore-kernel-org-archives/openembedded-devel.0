Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0336E7392B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:09:59 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NL20053L7SBW350@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	11 Mar 2015 13:09:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ReEn0Opq c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=emO1SXQWCLwA:10	a=lRxpQPx1AAAA:8 a=Q4-j1AaZAAAA:8
	a=P4M1KIEvQw6RqxE3pdQA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 20F87200EC; Wed,
	11 Mar 2015 14:09:46 -0400 (EDT)
Date: Wed, 11 Mar 2015 14:09:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150311180946.GA19558@denix.org>
References: <20150310172917.GF2340@jama>
	<1426019866-3634-1-git-send-email-frederico@cadete.eu>
MIME-version: 1.0
In-reply-to: <1426019866-3634-1-git-send-email-frederico@cadete.eu>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Frederico Cadete <frederico.cadete@awtce.be>
Subject: Re: [meta-qt5][PATCH v2] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Wed, 11 Mar 2015 18:10:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Martin,

Any ETA for when you plan to merge master-next into master with this fix? 
Thanks.


On Tue, Mar 10, 2015 at 09:37:46PM +0100, Frederico Cadete wrote:
> From: Frederico Cadete <frederico.cadete@awtce.be>
> 
> Gitorious disabled the git:// protocol, breaking fetches.
> Also, this service is scheduled to stop in May 2015, so move to
> code.qt.io.
> 
> Signed-off-by: Frederico Cadete <frederico@cadete.eu>
> ---
>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
>  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
>  recipes-qt/qt5/qt5-git.inc                   | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
>  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> index 4f7022c..60edaa4 100644
> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
>  DEPENDS = "qtdeclarative qtgraphicaleffects"
>  
>  SRCREV = "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
> -SRC_URI = "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
> +SRC_URI = "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
>  
>  S = "${WORKDIR}/git/QtDemo"
>  
> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> index 9194a83..df80407 100644
> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> @@ -5,7 +5,7 @@ require ${PN}.inc
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
>  
>  SRC_URI = "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>  "
>  
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
> index da962b8..84ddf49 100644
> --- a/recipes-qt/qt5/qt5-git.inc
> +++ b/recipes-qt/qt5/qt5-git.inc
> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?= "5.4"
>  
>  # each module needs to define valid SRCREV
>  SRC_URI += " \
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>  "
>  
>  S = "${WORKDIR}/git"
> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
> index cebc021..5a308d4 100644
> --- a/recipes-qt/qt5/qtbase-native_git.bb
> +++ b/recipes-qt/qt5/qtbase-native_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
>  
>  SRC_URI = "\    
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>  "
>  
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index d33eb68..549c92a 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -2,7 +2,7 @@ require qt5-git.inc
>  require ${PN}.inc
>  
>  SRC_URI = "\
> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
>  "
>  
>  # common for qtbase-native, qtbase-nativesdk and qtbase
> -- 
> 2.1.4
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

