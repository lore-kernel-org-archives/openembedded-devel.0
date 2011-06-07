Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QU2iW-0001ih-Sq
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 22:17:37 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMF00CPDS6SN6C2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	07 Jun 2011 15:13:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A5ABE14AF5D; Tue,
	07 Jun 2011 16:13:40 -0400 (EDT)
Date: Tue, 07 Jun 2011 16:13:40 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110607201340.GC2512@denix.org>
References: <1306055299-22875-1-git-send-email-eyalr@ti.com>
MIME-version: 1.0
In-reply-to: <1306055299-22875-1-git-send-email-eyalr@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCHv2] tzcdode-native: modify to use the latest version
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
X-List-Received-Date: Tue, 07 Jun 2011 20:17:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 22, 2011 at 12:08:19PM +0300, Eyal Reizer wrote:
> * tzcode-native_2011b is not available anymore for download

Eyal,

oe.dev already has 2011e version, while maintenance is slightly behind with 
2011b. Please submit the patch to move from 2011e instead of 2011b.

I'll try to include it in my next pull request. Thanks.

-- 
Denys

> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  ...code-native_2011b.bb => tzcode-native_2011g.bb} |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
>  rename recipes/tzcode/{tzcode-native_2011b.bb => tzcode-native_2011g.bb} (51%)
> 
> diff --git a/recipes/tzcode/tzcode-native_2011b.bb b/recipes/tzcode/tzcode-native_2011g.bb
> similarity index 51%
> rename from recipes/tzcode/tzcode-native_2011b.bb
> rename to recipes/tzcode/tzcode-native_2011g.bb
> index 30996d9..65d8cec 100644
> --- a/recipes/tzcode/tzcode-native_2011b.bb
> +++ b/recipes/tzcode/tzcode-native_2011g.bb
> @@ -6,11 +6,12 @@ require tzcode-native.inc
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
>  
> -TZDATA_PV = "2011b"
> +TZDATA_PV = "2011g"
>  
>  PR = "${INC_PR}.0"
>  
> -SRC_URI[tzcode-2011b.md5sum] = "c63a1425f7252aef1fe54a258cdccff8"
> -SRC_URI[tzcode-2011b.sha256sum] = "8031d05102e5c5109521a282aaab0629680bec82db783c716905802313678d67"
> -SRC_URI[tzdata-2011b.md5sum] = "9eaf3ca354c42a32bd28e623539bf0e0"
> -SRC_URI[tzdata-2011b.sha256sum] = "ff45f5ddc2ec925249626d00d7bc2ffff587e0956a1d8245517a023bf27e4cc9"
> +SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
> +SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
> +SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
> +SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
> +
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


