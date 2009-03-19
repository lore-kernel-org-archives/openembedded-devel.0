Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lk65F-0005kW-JK
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 01:26:08 +0100
Received: by wf-out-1314.google.com with SMTP id 25so358812wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 17:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+d6gwfrC3H0QYXyxwX/6ydt2v5/dhhSC2bQPL7SXzVM=;
	b=kd2veSetPSMNdcDj4CCkSJkk5Llfsd2JJ+OLquesNLum2PE06INZrASFwgRRFDUrxo
	kEiJP0VDgFFlL0dIGtaT5fIr/s5Aa2mCn3aH+BNBiK/qbu3fAku7uCYzUyxzb2VTj15s
	UsvVEm6EYDJOQAjeNITCLChjkHRj0aNu9aHBs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EpK1ug8m9WuVgbYrkt900YKAHZmCdDaGkOJONO1uJ58gVbjDgneez/l7O8cHkjmFIT
	HJY/9Zay/pIt7Bfu9kiyYz45lKsAjU25eqS15P0bxXYbu43pjIwOqsrnc5ql+rEVn63C
	loFNn9wLU85epVFwdzuyNYY/ZFTgcEDteQSVI=
MIME-Version: 1.0
Received: by 10.142.116.12 with SMTP id o12mr708024wfc.332.1237422311693; Wed, 
	18 Mar 2009 17:25:11 -0700 (PDT)
In-Reply-To: <20090317192619.GA15734@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BEF545.4040608@dls.net> <20090317192619.GA15734@denix.org>
Date: Wed, 18 Mar 2009 17:25:11 -0700
Message-ID: <f46da1cf0903181725y177da239y9970995168a677b7@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.200.174
X-SA-Exim-Mail-From: taroth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Thu, 19 Mar 2009 00:26:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2009 at 12:26 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Mon, Mar 16, 2009 at 07:56:37PM -0500, Mike (mwester) wrote:
>>
>> Denys Dmytriyenko wrote:
>> > Renaming packages/ directory to recipes/, as one of the several struct=
ural
>> > changes, was proposed by Koen[1] and agreed/approved by many. Since Ko=
en
>> > currently doesn't have time/ability to do the change, and some people =
are
>> > too eager to wait any longer, he asked me to do it. Please ack/nack.
>>
>> Ack. =A0 But can you please tag the revision immediately preceeding the
>> commit of this change so we have some easy-to-reference point[*] in the
>> history?
>
> Done. mv-packages-to-recipes-pre and mv-packages-to-recipes-post are the =
tags
> applied right before and right after the change.
>

Is the packages directory supposed to be empty now? There are still a
few subdirs left:


roth@dorkboy:~/dev/OE/openembedded/packages$ ls -1
automake/
blueprobe/
busybox/
coreutils/
gnome/
gpe-gallery/
pkgconfig/
pyneo/
qt4/
udev/


I will generate a patch to the usermanual to note the new recipes
directory. I am curious is the old packages will still be kept around
or if it will be completely removed. If kept, how would it be
described versus the recipes dir?

Ted Roth


