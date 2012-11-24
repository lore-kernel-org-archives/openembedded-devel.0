Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TcIuX-0002FI-4s
	for openembedded-devel@openembedded.org; Sat, 24 Nov 2012 17:48:57 +0100
Received: (qmail 2311 invoked by uid 1003); 24 Nov 2012 16:34:46 -0000
Received: from unknown (HELO ?172.19.131.104?)
	(philip@opensdr.com@12.130.125.55)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Nov 2012 16:34:46 -0000
Message-ID: <50B0F724.6030803@balister.org>
Date: Sat, 24 Nov 2012 08:34:44 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1353774725-26969-1-git-send-email-philip@balister.org>
In-Reply-To: <1353774725-26969-1-git-send-email-philip@balister.org>
Subject: Re: [meta-oe][PATCH] python-cheetah : Drop RDEPENDS from native build.
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
X-List-Received-Date: Sat, 24 Nov 2012 16:48:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Just for the record, I hope someone points out a better solution for 
this problem.

Philip

On 11/24/2012 08:32 AM, Philip Balister wrote:
> If the native recipe has the RDEPENDS in, the build fails because these
> packages are not provided by python-native.
>
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>   meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> index 967be31..1dad958 100644
> --- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> +++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
> @@ -13,6 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>   inherit setuptools
>
>   RDEPENDS_${PN} = "python-pickle python-pprint"
> +RDEPENDS_${PN}_class-native = ""
>
>   BBCLASSEXTEND = "native"
>
>


