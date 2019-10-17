Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
	[209.85.219.181])
	by mail.openembedded.org (Postfix) with ESMTP id B008B7F69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 21:16:08 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id m1so1174218ybm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=wca2SZPTwPSo5GvdiYLhEobdrjChgOyCeAIeCmKlN1M=;
	b=qoBEhZeolj9GzBbRbeqRseEBacYis2cglAguW1bWlnyM+syORvkBbOfhGcdOIOTHAN
	7vBL/ccYz5jet15WqRMWT/IQB/EkamzzpmjQlQ8moCz5Q/g+mFdxQPGCne/h7w7UW5M5
	5TKlmVUZ5ZYF22hvfPtUlgLRC+7R4MPoRUaek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=wca2SZPTwPSo5GvdiYLhEobdrjChgOyCeAIeCmKlN1M=;
	b=IAHlZHwx/g7N6cCswTArB/giMACFComHxsWiMrVXQIgo7JFVbXvlBloqiCeC+gdUV9
	ci16riPlicmlq+98nA/Fw0J8qRvYNdERh70Su4mGrjI24xewcvNSucYkwmzDCM5Wkbpa
	wrA7Wo3Znx2K1gb0Vsgv/1Fmkht60G1f7dikpJIyxhLFsu5/sHuLlplRMNUUN/la/OJq
	QxzVW89vOTrNnVwf+r7w8sDul2NTdKwNHcE3byFnWU/dvAUPpLDlzXB8VYfTCN5H4oMr
	zKlFx5hEY2CumPSL79bKM1Bcy4CkcLMkI/3yCWMPORyBaurB3zTRtJIfO+MRdtmLfKAI
	nMtA==
X-Gm-Message-State: APjAAAVPVS9Cv0fKd3VZlyDSUzBuwgl+VY4wKbQUzCB9LvOBj6DbNv0i
	2yqtLH9eREblo2I6exCcEcFdo3BjMLtJLg==
X-Google-Smtp-Source: APXvYqxTXEXOGSbhIcsBhYCFQTzlL6lWAsrEjZT851898ssjVBiwOrDPe0nFnmNy+wSZr1gKwVS5bA==
X-Received: by 2002:a25:204:: with SMTP id 4mr3870791ybc.242.1571346969430;
	Thu, 17 Oct 2019 14:16:09 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id k6sm790877ywh.60.2019.10.17.14.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Oct 2019 14:16:08 -0700 (PDT)
Date: Thu, 17 Oct 2019 17:16:06 -0400
From: Tom Rini <trini@konsulko.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20191017211606.GS16029@bill-the-cat>
References: <20191017135309.32441-1-trini@konsulko.com>
	<a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
	<20191017141932.GJ16029@bill-the-cat>
	<11adeb7603d84ebc941d0835c5a00f0b@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <11adeb7603d84ebc941d0835c5a00f0b@XBOX03.axis.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Jan-Simon =?iso-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>
Subject: Re: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 21:16:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 17, 2019 at 09:12:27PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Tom Rini <trini@konsulko.com>
> > Sent: den 17 oktober 2019 16:20
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-devel@lists.openembedded.org; George Kiagiadakis
> > <george.kiagiadakis@collabora.com>; Jan-Simon Möller
> > <jsmoeller@linuxfoundation.org>
> > Subject: Re: [oe] [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
> > 
> > On Thu, Oct 17, 2019 at 02:11:11PM +0000, Peter Kjellerstedt wrote:
> > 
> > > Just to add to this, I have attached a recipe for pipewire that we 
> > > used to use (we have not used it for a while so it is not up-to-date). 
> > > It should hopefully give you some more ideas. E.g., it uses automatic
> > > splitting of all the spa and module packages similar to how the 
> > > GStreamer plugins are automatically split into separate packages.
> > 
> > I hesitate on adding stuff like this right now in that with 0.3 (and
> > audio support) a bunch more stuff changes.  One of my goals right now
> > is to get pipewire 0.2.7 in such that it meets Andreas' needs and then
> > with 0.3 later being able to confirm his use case still works when 
> > updating.
> 
> As I wrote, it was mainly to give you more ideas. Since we were sitting 
> on them, but not using them ourselves, I thought it better to pass them 
> along. Then you, or anyone else, can use them to improve the recipe at 
> a convenient time.

Yes, thanks.  I suspect that with 0.3 and later and even more
plugins/modules that will be a handy example to reference.

-- 
Tom

