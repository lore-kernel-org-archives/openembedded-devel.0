Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E845E7CE22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 09:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47n85V5gGYzRj;
	Tue, 31 Dec 2019 10:24:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577784287;
	bh=8UK9tVS3FiCBz2mPAXqIEAYsXwNObzeAuxpCTmc2Cfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8gbcJQT3vKumIzz1dzGhSBkzpKepMw395MCNfTGVRKc21QJ6frZXAi92aeVogTtE
	VELvSwtVopEaGaw0Bxg0JGAoH2jxncgUTITbUyfgRjKUxMxeoELsExASbcT8pcwgtP
	FI98iEkHQFrtyyyKX0dvpuLeUqfTzVwLTq9lQpvj8iqOmQ2LFBtcKp+XMCL1UhOlkh
	586t1pSUMYH6gwmZnvQg6F8fSXjakxXMwvQPQt7Im/qoM2D7FtYQLbE0MeTf+gNsoq
	l2Ac9oL2Vj+ove4XqAmzrT9QbhuZ4W/M1Prvedm04QPleLfTrNYXcU9EgUlVan6Qb4
	Uqo113aAlRjfxJA0hd31wgOFrkpjVxKtIgHrXQXB4xD3ggoYMGEPb1ExcywMxotJ4c
	M+Zu0dVK5eAi+vFOlfjAvKRHIGLsusSgA6whaZGeNiNbKnianzSl/TpaXOHBgL2Rq4
	KKG0QR03z2A32tetzkeJDoVXPOH4PU29qsPR2BBEYoxqTbaWF9KWwldVnYWwxB+VTk
	JZEdsDX+zLCRv/WSRdpABv/8FMUvDaM5OG0J+gWerYfMOH+36xWd7xxIK7lvAhcGHt
	LXe8FvlFylpa0v4U8ZwgYsgwWFwkP3LpD2o9NFC50pk9LEveK9uoXU65MuJZMrBcbZ
	1OsMXese1ZEYBqubxsjvX8Sw=
Date: Tue, 31 Dec 2019 11:24:44 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191231092444.GD934@localhost>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/8] glfw: Update to latest
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
X-List-Received-Date: Tue, 31 Dec 2019 09:24:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 30, 2019 at 05:06:46PM -0800, Khem Raj wrote:
>...
> FPIC in static archives is needed for arches like aarch64

This is not true.

What is the problem you were trying to fix?

>...
> +PV .= "git${SRCPV}"
>...

This should be +git${SRCPV}

cu
Adrian

