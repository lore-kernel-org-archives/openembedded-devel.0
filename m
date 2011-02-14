Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pp2Cd-00021g-9L
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 18:27:11 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pp2BV-00011u-Rb from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:26:01 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 09:25:51 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Feb 2011 10:25:50 -0700
Message-ID: <4D596594.5020907@mentor.com>
Date: Mon, 14 Feb 2011 10:25:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297667657-24563-1-git-send-email-schnitzeltony@gmx.de>
In-Reply-To: <1297667657-24563-1-git-send-email-schnitzeltony@gmx.de>
X-OriginalArrivalTime: 14 Feb 2011 17:25:51.0037 (UTC)
	FILETIME=[39EA1ED0:01CBCC6C]
Subject: Re: [PATCH] clutter: get dependency to json-glib to work
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
X-List-Received-Date: Mon, 14 Feb 2011 17:27:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2011 12:14 AM, Andreas Mueller wrote:
> * Error on fresh tmp build was
> * | checking for installed JSON-GLib... configure: error: not found
> * | ERROR: Function do_configure failed
>
> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
> ---
>   recipes/clutter/clutter_1.4.2.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/clutter/clutter_1.4.2.bb b/recipes/clutter/clutter_1.4.2.bb
> index 12b6eb5..08e52d5 100644
> --- a/recipes/clutter/clutter_1.4.2.bb
> +++ b/recipes/clutter/clutter_1.4.2.bb
> @@ -1,6 +1,6 @@
>   require clutter.inc
>
> -DEPENDS += "json-glib"
> +STDDEPENDS += "json-glib"
>
>   PR = "${INC_PR}.1"
>

Applied, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


