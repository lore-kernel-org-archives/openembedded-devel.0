Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Pxy5z-0006hd-Va
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 09:53:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 8D79FA46F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 08:51:31 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id a3dZujym+aDj
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 08:51:30 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 04144A46F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 08:51:29 +0000 (GMT)
Message-ID: <4D79E2E2.2080701@xora.org.uk>
Date: Fri, 11 Mar 2011 08:52:50 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299804808.5437.22.camel@computer>
In-Reply-To: <1299804808.5437.22.camel@computer>
X-Enigmail-Version: 1.1.1
Subject: Re: [PATCH] libevent: recipe for 2.0.10-stable version
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
X-List-Received-Date: Fri, 11 Mar 2011 08:53:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Your patches have been corrupted by MTA, please send as attachments.

The transmission ones can have

Acked-by: Graeme Gregory <dp@xora.org.uk>

Graeme

On 11/03/2011 00:53, Lukas-David Gorris wrote:
> From: Lukas-David Gorris <lukas.gorris@gmail.com>
> Date: Fri, 11 Mar 2011 01:47:24 +0100
> Subject: [PATCH 3/3] libevent: add recipe for 2.0.10-stable version
>
> ---
>  recipes/libevent/libevent_2.0.10-stable.bb |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/libevent/libevent_2.0.10-stable.bb
>
> diff --git a/recipes/libevent/libevent_2.0.10-stable.bb
> b/recipes/libevent/libevent_2.0.10-stable.bb
> new file mode 100644
> index 0000000..fa656dc
> --- /dev/null
> +++ b/recipes/libevent/libevent_2.0.10-stable.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "The libevent API provides a mechanism to execute a
> callback function \
> +when a specific event occurs on a file descriptor or after a timeout
> has been reached. \
> +Furthermore, libevent also support callbacks due to signals or regular
> timeouts."
> +HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
> +SECTION = "libs"
> +AUTHOR = "Niels Provos <provos@citi.umich.edu>"
> +LICENSE = "BSD"
> +PR = "r0"
> +
> +SRC_URI = "http://monkey.org/~provos/libevent-${PV}.tar.gz"
> +
> +inherit autotools
> +
> +SRC_URI[md5sum] = "a37401d26cbbf28185211d582741a3d4"
> +SRC_URI[sha256sum] =
> "a4b55810a9e21e9991b86ba5e82dbc9280598cc070544c4ecef4ab91b93dfc55"
> +



