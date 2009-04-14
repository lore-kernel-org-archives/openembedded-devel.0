Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LtdcN-0007Qw-Un
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 10:03:59 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LtdYo-00081I-AJ
	for openembedded-devel@openembedded.org; Tue, 14 Apr 2009 08:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 08:00:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Apr 2009 08:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Apr 2009 09:55:46 +0200
Message-ID: <gs1fi2$387$1@ger.gmane.org>
References: <1239458459-2493-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090407 Shredder/3.0b3pre
In-Reply-To: <1239458459-2493-1-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] gst-plugins-base: depend on libtheora so gst-plugin theora gets built
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
X-List-Received-Date: Tue, 14 Apr 2009 08:03:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 11-04-09 16:00, Koen Kooi wrote:
> From: Koen Kooi<koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   recipes/gstreamer/gst-plugins-base_0.10.22.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/gstreamer/gst-plugins-base_0.10.22.bb b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
> index 92f2f56..3086d93 100644
> --- a/recipes/gstreamer/gst-plugins-base_0.10.22.bb
> +++ b/recipes/gstreamer/gst-plugins-base_0.10.22.bb
> @@ -2,11 +2,11 @@ require gst-plugins.inc
>
>   PROVIDES += "gst-plugins"
>
> -PR = "r1"
> +PR = "r2"
>
>   # gst-plugins-base only builds the alsa plugin
>   # if alsa has been built and is present.  You will
>   # not get an error if this is not present, just
>   # a missing alsa plugin
> -DEPENDS += "alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
> +DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs libxv"
>




