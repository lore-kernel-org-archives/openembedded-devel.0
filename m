Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SbeRJ-0003r1-W4
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 23:04:29 +0200
Received: (qmail 16371 invoked by uid 1003); 4 Jun 2012 20:52:47 -0000
Received: from unknown (HELO ?192.168.1.108?) (philip@opensdr.com@71.171.27.98)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Jun 2012 20:52:47 -0000
Message-ID: <4FCD2043.7010207@balister.org>
Date: Mon, 04 Jun 2012 16:53:23 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1338831160-14023-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
In-Reply-To: <1338831160-14023-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [meta-oe][PATCH] python-numpy: Fixed numpy dependencies.
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
X-List-Received-Date: Mon, 04 Jun 2012 21:05:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Can you make the commit message something like:

python-numpy : Add missing dependencies.

Numpy was missing a number of dependencies in the .bb file without which
it will not work.

On 06/04/2012 01:32 PM, Dan McDougall wrote:
> Numpy was missing a number of dependencies in the .bb file without which it will
> not work.
> 
> Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
> ---
>  .../recipes-devtools/python/python-numpy_1.4.1.bb  |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> index 36ab622..bae624e 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> @@ -24,3 +24,8 @@ do_compile_prepend() {
>  
>  SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
>  SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
> +
> +RDEPENDS_${PN} = "python-unittest \
> +                  python-diffutils \
> +                  python-pprint \
> +                 "


