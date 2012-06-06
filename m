Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1ScIJ5-0007cU-GU
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:38:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0FD5EF81222; Wed,  6 Jun 2012 09:27:32 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E9EE9F811FA;
	Wed,  6 Jun 2012 09:27:18 -0600 (MDT)
Message-ID: <4FCF76D6.4040909@mlbassoc.com>
Date: Wed, 06 Jun 2012 09:27:18 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
In-Reply-To: <1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
Subject: Re: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Wed, 06 Jun 2012 15:38:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-06-06 09:20, Dan McDougall wrote:
> The previous patch had python-diffutils when it should have been
> python-difflib.
>
> Signed-off-by: Dan McDougall<daniel.mcdougall@liftoffsoftware.com>
> ---
>   .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> index bae624e..702f224 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -26,6 +26,6 @@ SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
>   SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
>
>   RDEPENDS_${PN} = "python-unittest \
> -                  python-diffutils \
> +                  python-difflib \
>                     python-pprint \
>                    "

Since these patches have not yet been accepted/merged, shouldn't
you squash them into one?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


