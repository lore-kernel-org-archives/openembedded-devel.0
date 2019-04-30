Return-Path: <prvs=0162804a6=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 96C307DC69
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1556609661; x=1588145661;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=ypM9I1kC89fAI2fP1U2IZvoZ3pHYIYFQHSmEGixbA8g=;
	b=Ji++Z2mqgxG3358j26Njcae6F+nXqtoYB6Ll8Teup9NfbBxjHdnsCI4+
	UMpADAvYOunL2Qu7ogZeBEPiWb/WWC45NkFyWpiZ0HaB8f3/cKbwJZ/k3
	HFSP8T6k+3jZKLNZt7vYb6ytsyqL1fM2+PpRQ4jt/AudkPig6MltG9+hG
	8c3tmWM0sUGaEUxLMG0MDUEbm2wJ3C9Ia3SQSo0KcKjvogyl1xV9IeWRH
	GFM0bNRT6atR2rfhe94HrBI84hZTdGgwn3oCSsEViINrTJ/7al94qCKo1
	WsPdydclxlVzSIjkHP3zgsNkPso+QXEEppnEuanfu4Ds9kx9ffFdp30rL Q==;
IronPort-SDR: JzlwckpdutQNnbMOiF8sm45QX72VTwsbRENdwhOVMa8NM1/oLu4eosha0xCTRLyVOPZud4yfQv
	1c+/sO3p/N70dTStykOoRN9iOs/DB2DFS+szP0N+6GzsIR1/qOexgtKFZ/uOms2dxAGL0QcIcZ
	aQGLBURpy6PtcrFgoeabErGkPDJECW5AGaEGQyR3rg2h82JZ3iIxBwXH+0T9j+LEU6WfF4venS
	OntrqVcmPKl15aAT60jvq3nHq895/P2+dVQ74UxwKGEbV3tJadLyuqGFPyqdNv4hX8HxdX0R+B
	Z8c=
X-IronPort-AV: E=Sophos;i="5.60,412,1549926000"; d="scan'208";a="16742718"
To: <openembedded-devel@lists.openembedded.org>
References: <20190411213317.20935-1-alistair.francis@wdc.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <51a3fd9f-e23d-4eb7-99fe-63fbb48b6499@skidata.com>
Date: Tue, 30 Apr 2019 09:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411213317.20935-1-alistair.francis@wdc.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] layer.conf: Mark warrior as supported
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2019 07:34:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
sorry for the late reply. I had this patch already in my local 
master-next for weeks but forgot to push.

Just did it now. Sorry again for the delay.

regards;Richard.L

On 11/04/2019 23:34, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   conf/layer.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b03a608..90236be 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>   BBFILE_COLLECTIONS += "meta-java"
>   BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-java = "10"
> -LAYERSERIES_COMPAT_meta-java = "thud"
> +LAYERSERIES_COMPAT_meta-java = "thud warrior"
>   
>   LICENSE_PATH += "${LAYERDIR}/licenses"
>   
> 

