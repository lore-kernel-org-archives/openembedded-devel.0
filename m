Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeSmn-00030e-Cx
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 12:55:29 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1245113rvb.0
	for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 03:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=ZsO2JZekuvuhSac9wD5nkluAY2KJwpkD57FOsRRuVwY=;
	b=Zs6yassuNikF+CHBwd4Vl2g4+2A2ppkHJQBHc1s4/LCClnFGajauyW5ITjiH52ipCa
	rnb36BjOOG903Y0yoLQwNGEystsYNLPjxxL7HbObIKerBvHilu/Byh1/pj04VP+0TDPu
	quqN1dg6A1A5AgjNJrCs/PFvbFNVhdzOBZRgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Sk9DwZoB94qg0dWrwU2ZIVhuIXdXKKllPlEhsxk6O01EE+FwVafJLWxWDUoF706JQa
	VwoeHysG6W99Nj37qfQ0jlHt16Ka+o2o9/7OrOQeCnF6X7WJa0q4e55h26BJwxDxVUE6
	jUI36A6yx+YRiT7njGtFWvBMzyslRx09II/yI=
Received: by 10.140.201.8 with SMTP id y8mr3304415rvf.28.1221303159789;
	Sat, 13 Sep 2008 03:52:39 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Sat, 13 Sep 2008 03:52:39 -0700 (PDT)
Message-ID: <94a0d4530809130352v5775be53sc14b354b8c1dae15@mail.gmail.com>
Date: Sat, 13 Sep 2008 13:52:39 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: "Jakub Narebski" <jnareb@gmail.com>
In-Reply-To: <m3d4j8nzy9.fsf@localhost.localdomain>
MIME-Version: 1.0
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
	<m3d4j8nzy9.fsf@localhost.localdomain>
Cc: devel@pidgin.im, openembedded-devel@openembedded.org,
	monotone-devel@nongnu.org, git@vger.kernel.org
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 10:55:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 13, 2008 at 12:45 PM, Jakub Narebski <jnareb@gmail.com> wrote:
> "Felipe Contreras" <felipe.contreras@gmail.com> writes:
>
>> This is the result of various experiments I've been doing while trying
>> to import mtn repositories into git. I've looked into other mtn2git
>> scripts but none fitted my needs.
>
> mtn or mnt?

monotone = mtn

>> After some RFCs on git and monotone mailing lists it seems now that
>> the script is going in the right direction.
>
> When you feel this script to be ready, could you add it to the
> "Interaction with other Revision Control Systems" section on
>  http://git.or.cz/gitwiki/InterfacesFrontendsAndTools
> As far as I can see there ain't any Monotone to Git converter on this
> list.

Ok, done. I think it's ready if you can bare the slowness of the
'checkout' method. The only missing feature is tags, but should be
easy to implement.

-- 
Felipe Contreras


