Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LaZcb-0003g6-Gr
	for openembedded-devel@openembedded.org; Fri, 20 Feb 2009 18:57:09 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LaZaC-00039o-1S
	for openembedded-devel@openembedded.org; Fri, 20 Feb 2009 17:54:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 20 Feb 2009 17:54:40 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Feb 2009 17:54:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Feb 2009 18:54:30 +0100
Message-ID: <gnmqom$50a$1@ger.gmane.org>
References: <1235130913-15461-1-git-send-email-ihar.hrachyshka@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <1235130913-15461-1-git-send-email-ihar.hrachyshka@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] Check if package provides qtopia-core not package name
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
X-List-Received-Date: Fri, 20 Feb 2009 17:57:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-02-09 12:55, Ihar Hrachyshka wrote:
> This change fixes dependency loops for qtopia-core and qt-embedded.
>
> Signed-off-by: Ihar Hrachyshka<ihar.hrachyshka@gmail.com>
> ---
>   classes/qtopia4core.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/classes/qtopia4core.bbclass b/classes/qtopia4core.bbclass
> index b5f10fa..214232d 100644
> --- a/classes/qtopia4core.bbclass
> +++ b/classes/qtopia4core.bbclass
> @@ -1,4 +1,4 @@
> -DEPENDS_prepend = "${@["qtopia-core ", ""][(bb.data.getVar('PN', d, 1) == 'qtopia-core')]}"
> +DEPENDS_prepend = "${@["qtopia-core ", ""]['qtopia-core' in bb.data.getVar('PROVIDES', d, 1)]}"
>   inherit qmake2
>
>   QT_DIR_NAME = "qtopia"

Acked-by: Koen Kooi <koen@openembedded.org>



