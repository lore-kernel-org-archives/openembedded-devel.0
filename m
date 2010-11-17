Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PIdZ5-0005nI-TJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 09:40:29 +0100
Received: by gxk2 with SMTP id 2so994935gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 00:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=dVQnKN/DYQY4cqv440+e8gK86jSq5rFaxxRt8onI8sM=;
	b=uIpevRkvABA4w8ECGZgtED+fnBGaEkOEJVanKPtU/TCPfvD2fvkwIOywckkY9f5mm6
	8DvAIKrTsbMLJ4gW6MTsJM4/w/DC/ZMkasnKCfuyuVjnNjEc/BvvoAuESudOn6Whn3Il
	xpXEAbsz5VMLlL7NF6Bq2nCbDMnUspkdicoQ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=CxZ+ht1G3Q8JsNRAeDpzzWSdCQbYqVeP2RZqL5pyp4gQo248mArW3rjLniEunUl5aL
	eDh+mJ/SFdok9oBR05WPXMI/Lz493glwcn5fotnVpwazIsiVleuB/H+x0Qvi7KqYExGL
	jv3ULES6ypwobPGQaRtVxl/q/Bvj3S5QNfcqE=
Received: by 10.90.217.17 with SMTP id p17mr11119690agg.121.1289983158958;
	Wed, 17 Nov 2010 00:39:18 -0800 (PST)
MIME-Version: 1.0
Sender: pixdamix@gmail.com
Received: by 10.90.124.2 with HTTP; Wed, 17 Nov 2010 00:38:48 -0800 (PST)
In-Reply-To: <AANLkTiksrxSauzYBx+EupT+vkLyt_C0VgUDeXb8PxtF8@mail.gmail.com>
References: <1289064270-20041-1-git-send-email-moncelier@devlife.org>
	<1289064270-20041-2-git-send-email-moncelier@devlife.org>
	<AANLkTiksrxSauzYBx+EupT+vkLyt_C0VgUDeXb8PxtF8@mail.gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
Date: Wed, 17 Nov 2010 09:38:48 +0100
X-Google-Sender-Auth: IQiTgPAnYFhG3fCvA6Kez3H7beA
Message-ID: <AANLkTi=B4o0F6LAcfhG7gz8EKBCT14-V7rjUDY8-Yp_o@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 02/11] dropbear: Removed openmoko references. Added /etc/default/dropbear
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
X-List-Received-Date: Wed, 17 Nov 2010 08:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 17, 2010 at 12:40 AM, Khem Raj <raj.khem@gmail.com> wrote:

 > diff --git a/recipes/dropbear/dropbear/default
> b/recipes/dropbear/dropbear/default
> > new file mode 100644
> > index 0000000..a4f2bfd
> > --- /dev/null
> > +++ b/recipes/dropbear/dropbear/default
> > @@ -0,0 +1,4 @@
> > +# DROPBEAR_BANNER=""
> > +# DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"
> > +# DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"
>
>        ^^^
> should this be dsa ?


Nope, it's DSS . You can look in recipes/dropbear/dropbear/init,
dropbearkey use dss for its key type.

-- 
Camille Moncelier
http://devlife.org/

If Java had true garbage collection, most programs would
delete themselves upon execution.

