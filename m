Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5C26CE51
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 00:16:07 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB008C2Q2S1J60@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	07 Oct 2013 19:16:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4164620091; Mon,
	07 Oct 2013 20:16:04 -0400 (EDT)
Date: Mon, 07 Oct 2013 20:16:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-id: <20131008001604.GJ18775@denix.org>
References: <1381188738-29468-1-git-send-email-eric@eukrea.com>
MIME-version: 1.0
In-reply-to: <1381188738-29468-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/18] qtgraphicaleffects: allow empty package
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
X-List-Received-Date: Tue, 08 Oct 2013 00:16:08 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

And the series misses qtquickcontrols-5.1.0, qtserialport-5.1.0 and 
qttools-native-5.1.0 - those require qt5-${PV}.inc which is now renamed and it 
breaks parsing...

On Tue, Oct 08, 2013 at 01:32:01AM +0200, Eric Bénard wrote:
> else populatesdk will fail because qtgraphicaleffects-dev can't
> find qtgraphicaleffects
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qtgraphicaleffects.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
> index 63e884e..06b5350 100644
> --- a/recipes-qt/qt5/qtgraphicaleffects.inc
> +++ b/recipes-qt/qt5/qtgraphicaleffects.inc
> @@ -1,3 +1,5 @@
>  require qt5.inc
>  
>  DEPENDS += "qtdeclarative"
> +
> +ALLOW_EMPTY_${PN} = "1"
> -- 
> 1.8.4.rc3
> 

