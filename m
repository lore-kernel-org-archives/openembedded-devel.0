Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P60d1-00019V-G7
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 14:40:20 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id BEC7B1B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 12:40:26 +0000 (UTC)
Message-ID: <4CB5A897.2000003@freyther.de>
Date: Wed, 13 Oct 2010 14:39:51 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.1290.1286961912.3514.openembedded-devel@lists.openembedded.org>	<4CB58BAD.5090806@gmail.com>
	<4CB5A86D.6020304@gmail.com>
In-Reply-To: <4CB5A86D.6020304@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 12:40:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/13/2010 02:39 PM, Tasslehoff Kjappfot wrote:

> 
> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> ---
>  recipes/apr/apr-util_1.3.4.bb |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/apr/apr-util_1.3.4.bb b/recipes/apr/apr-util_1.3.4.bb
> index cc6781b..5e31171 100644
> --- a/recipes/apr/apr-util_1.3.4.bb
> +++ b/recipes/apr/apr-util_1.3.4.bb
> @@ -14,6 +14,7 @@ EXTRA_OECONF =
> "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
>          --with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
>          --without-sqlite2 \
>          --without-sqlite3 \
> +                --without-pgsql \

hmm... the existing file is using spaces, you use tabs... I will fix it when
pushing the changes. Please try to follow the indention of the file.




