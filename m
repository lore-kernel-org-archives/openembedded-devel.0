Received: from [87.194.255.144] (helo=honeysuckle.london.02.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bluelightning@bluelightning.org>) id 1MACqZ-0007pO-TG
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 02:54:51 +0200
Received: from shodan.localnet (93.96.131.185) by honeysuckle.london.02.net
	(8.5.016.1)
	id 4A20303F00028D6F for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 01:46:21 +0100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 May 2009 01:46:20 +0100
User-Agent: KMail/1.11.2 (Linux/2.6.28-11-generic; KDE/4.2.2; i686; ; )
References: <20090529223531.GA951@misibook.miska.isageek.net>
In-Reply-To: <20090529223531.GA951@misibook.miska.isageek.net>
MIME-Version: 1.0
Message-Id: <200905300146.20637.bluelightning@bluelightning.org>
Subject: Re: [PATCH] opie-sheet: fixed compilation error
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
X-List-Received-Date: Sat, 30 May 2009 00:54:52 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, 29 May 2009, Michal Hrusecky wrote:
> Compilation originally fails and complains about two arguments with the
> same name.
>
> Signed-off-by: Michal Hrusecky <Michal@Hrusecky.net>

Acked-by: Paul Eggleton <bluelightning@bluelightning.org>

> ---
>  .../opie-sheet/different-arg-names.patch           |   11 +++++++++++
>  recipes/opie-sheet/opie-sheet_1.2.4.bb             |    3 ++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/opie-sheet/opie-sheet/different-arg-names.patch
>
> diff --git a/recipes/opie-sheet/opie-sheet/different-arg-names.patch
> b/recipes/opie-sheet/opie-sheet/different-arg-names.patch new file mode
> 100644
> index 0000000..f190960
> --- /dev/null
> +++ b/recipes/opie-sheet/opie-sheet/different-arg-names.patch
> @@ -0,0 +1,11 @@
> +--- a/opie-sheet/sheet.h	2009-05-25 07:47:12.042719009 +0200
> ++++ b/opie-sheet/sheet.h	2009-05-25 08:07:19.291516199 +0200
> +@@ -209,7 +207,7 @@
> +     void insertRows(int no=1, bool allColumns=TRUE);
> +     void insertColumns(int no=1, bool allRows=TRUE);
> +
> +-    void dataFindReplace(const QString &find, const QString &replace,
> bool matchCase=TRUE, bool allCells=TRUE, bool entireCell=FALSE, bool
> replace=FALSE, bool replaceAll=FALSE); ++    void dataFindReplace(const
> QString &find, const QString &replacestr, bool matchCase=TRUE, bool
> allCells=TRUE, bool entireCell=FALSE, bool replace=FALSE, bool
> replaceAll=FALSE); +
> +     // Static functions
> +     static int getHeaderColumn(const QString &section);
> diff --git a/recipes/opie-sheet/opie-sheet_1.2.4.bb
> b/recipes/opie-sheet/opie-sheet_1.2.4.bb index ca0cdaf..c52c166 100644
> --- a/recipes/opie-sheet/opie-sheet_1.2.4.bb
> +++ b/recipes/opie-sheet/opie-sheet_1.2.4.bb
> @@ -3,4 +3,5 @@ require ${PN}.inc
>
>  SRC_URI = "${HANDHELDS_CVS};tag=${TAG};module=opie/noncore/apps/opie-sheet
> \ ${HANDHELDS_CVS};tag=${TAG};module=opie/pics \
> -           ${HANDHELDS_CVS};tag=${TAG};module=opie/apps"
> +           ${HANDHELDS_CVS};tag=${TAG};module=opie/apps \
> +           file://different-arg-names.patch;patch=1 "




