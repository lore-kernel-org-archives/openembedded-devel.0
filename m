Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Py3Vw-0004Hi-Uq
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:40:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 997A8A470E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:38:46 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id NTkfnbg9qBrH
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:38:45 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id D58CEA470B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 14:38:44 +0000 (GMT)
Message-ID: <4D7A3445.3010804@xora.org.uk>
Date: Fri, 11 Mar 2011 14:40:05 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299778654-14912-1-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1299778654-14912-1-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH] gettext.bbclass: Add virtclass DEPENDS prepends
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
X-List-Received-Date: Fri, 11 Mar 2011 14:40:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Looks sensible to me

Acked-by: Graeme Gregory <dp@xora.org.uk>

G

On 10/03/2011 17:37, Tom Rini wrote:
> With BBCLASSEXTEND recipes which also modify DEPENDS_virtclass-native
> gettext.bbclass is otherwise not working and gettext-native isn't
> added.  So we need to have a DEPENDS_virtclass-$foo_prepend to
> make sure GETTEXT_DEPENDS gets in.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  classes/gettext.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/gettext.bbclass b/classes/gettext.bbclass
> index 6c480b5..2303311 100644
> --- a/classes/gettext.bbclass
> +++ b/classes/gettext.bbclass
> @@ -14,4 +14,7 @@ python () {
>  DEPENDS_GETTEXT = "gettext-native virtual/libiconv virtual/libintl"
>  
>  DEPENDS =+ "${DEPENDS_GETTEXT}"
> +DEPENDS_virtclass-native_prepend = "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-nativesdk_prepend = "${DEPENDS_GETTEXT} "
> +DEPENDS_virtclass-cross_prepend = "${DEPENDS_GETTEXT} "
>  EXTRA_OECONF += "--enable-nls"



