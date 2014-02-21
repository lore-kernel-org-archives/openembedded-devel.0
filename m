Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 764276B86F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:12:43 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1D008T06W87610@vms173025.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	21 Feb 2014 15:12:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 057A2200BA; Fri,
	21 Feb 2014 16:12:07 -0500 (EST)
Date: Fri, 21 Feb 2014 16:12:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140221211207.GW22890@denix.org>
References: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1393015264-8343-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 1/4] qmake5_base.bbclass: Use Qt version path for headers
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
X-List-Received-Date: Fri, 21 Feb 2014 21:12:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Feb 21, 2014 at 05:41:01PM -0300, Otavio Salvador wrote:
> When looking for Qt5 headers we ought to use the Qt5 specific path. In
> case the distribution wants to have a flat tree it can set QT_DIR_NAME
> and it will still works as expected.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Denys Dmytriyenko <denys@ti.com>

Martin,

Thinking about what you said in that Wiki section - I believe the number of 
apps consuming headers from /usr/include/qt5 is much higher than number of 
non-Qt5 libs/modules potentially installing headers in there... So, we 
shouldn't require every app recipe to set PATH_HEADERS properly.


> ---
>  classes/qmake5_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 3861cd0..0cfb5a4 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -57,7 +57,7 @@ do_generate_qt_config_file() {
>      cat > ${QT_CONF_PATH} <<EOF
>  [Paths]
>  Prefix = ${OE_QMAKE_PATH_PREFIX}
> -Headers = ${OE_QMAKE_PATH_HEADERS}
> +Headers = ${OE_QMAKE_PATH_QT_HEADERS}
>  Libraries = ${OE_QMAKE_PATH_LIBS}
>  ArchData = ${OE_QMAKE_PATH_ARCHDATA}
>  Data = ${OE_QMAKE_PATH_DATA}
> -- 
> 1.7.10.4
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

