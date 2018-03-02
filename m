Return-Path: <jsbronder@cold-front.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 84128789C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 20:54:57 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6447520F9E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 15:54:58 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Fri, 02 Mar 2018 15:54:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=yUw+SBBxPSqcyIw/kfnMLV77kARASOA91OHQ3RHmrJs=; b=EBDVa
	UTpbIoKhxj+pSIZ61N5HgmiBNa+4o5mDQnRsfPUrIc1ISw03uW5E0ZTjMCUAtbxW
	BSHHS0QnJMblHybFnPNDgozwlZg8a0nHZCK5OzawezfWfmYIQpEQHcmN4WkYrlGH
	WhTGf/ovTR/TxAFI5eKNjpmu4Kw+0pfvLqKNfg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=yUw+SBBxPSqcyIw/kfnMLV77kARAS
	OA91OHQ3RHmrJs=; b=XMe26hbVk/nQ2CSn5xKqW8upZfj5nk1TpK2xRm2LEYXPa
	OoBmodIPspAJwQDmOxPVgFvskWT4q3tvpJ1tzsZeLJvnIF3MECnIhYdhpOlSw/TG
	MKi/vSghvgirjgMzN3eUVwuiyx4E0lmsYDGYKTSTrBdPM15Dq2aKzkGrfdiyW8j2
	nw1pygR3jG2wdIUD1bkMFHk0TSamGTbT+bZij2PiJfG64A5H2U7UJ6og71kclxiI
	wLCy38Chtd4Aps3wmrq3QPE7k9c2cusvWcrInmrelhnmBT+iMaPu9oviFY4VxGcw
	wrZFe+YpzVAXDliM2obfGV8vYRS+5v4FBEFo7fj3A==
X-ME-Sender: <xms:IrqZWhJ5-cDf1Y3w4PbkmorM4tB7WyQp7pmUM40flKU7l1YUB0gxUg>
Received: from localhost (cold-front.org [173.230.129.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1D52D2482D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 15:54:58 -0500 (EST)
Date: Fri, 2 Mar 2018 15:54:57 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180302205457.GL23655@lasswell>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <20180302203140.6397-1-jsbronder@cold-front.org>
MIME-Version: 1.0
In-Reply-To: <20180302203140.6397-1-jsbronder@cold-front.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: cppzmq: 4.2.3 update
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
X-List-Received-Date: Fri, 02 Mar 2018 20:54:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please ignore this, I pasted in the wrong sha.  I'll fix and resubmit.

On 02/03/18 15:31 -0500, Justin Bronder wrote:
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index a64745c94..b660b69da 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
>  DEPENDS = "zeromq"
>  
> -SRCREV = "68a7b09cfce01c4c279fba2cf91686fcfc566848"
> -PV = "4.1.5+git${SRCPV}"
> +SRCREV = "3226b8ebddd9c6c738ba42986822c26418a49afb"
> +PV = "4.2.3+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/zeromq/cppzmq.git"
>  
> -- 
> 2.13.6
> 

-- 
Justin Bronder

