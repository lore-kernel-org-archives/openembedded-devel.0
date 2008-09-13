Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeWye-0000KA-G1
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 17:24:00 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1330483rvb.0
	for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=iO/l0Ca5JynDZsVrt8EHbq1YHFzyyid7xQn2AxalQ0c=;
	b=I78JldFGY3jEiSpMp2be0GwEh+oNkdfMgn8+pLUIvO6cFTBk3rstrmgmVBXME0vVq3
	AhKt4jqRdQgPP/u481LkP0j71Q0/LTz7KmqRlOiXiMSEeWts9sfCwkqODNA7/NR1FdNV
	NTEJOIGOHYWi2QG/473YfInjxjcZs6/6XXiQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=Efjd0xQrIF81LkYNCYkIXXhl6Av8A/l+AITZuqWdwN61l7oZ47gfvVrORSSgcxCAQn
	oOcYv1pLP/hT2n3SnSulbEDGWwOI/unSMiouIku0TZ/42jRkCmuuq1s57LY3IYtvtwk4
	NBAHZhLi2Y2n1anyILDIbi4U1ziTqWbB2H+gM=
Received: by 10.140.147.5 with SMTP id u5mr3406473rvd.274.1221319270222;
	Sat, 13 Sep 2008 08:21:10 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Sat, 13 Sep 2008 08:21:10 -0700 (PDT)
Message-ID: <94a0d4530809130821h6f424695xe09386243c3213c3@mail.gmail.com>
Date: Sat, 13 Sep 2008 18:21:10 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: "Jakub Narebski" <jnareb@gmail.com>
In-Reply-To: <200809131402.11413.jnareb@gmail.com>
MIME-Version: 1.0
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
	<m3d4j8nzy9.fsf@localhost.localdomain>
	<94a0d4530809130352v5775be53sc14b354b8c1dae15@mail.gmail.com>
	<200809131402.11413.jnareb@gmail.com>
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
X-List-Received-Date: Sat, 13 Sep 2008 15:24:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 13, 2008 at 3:02 PM, Jakub Narebski <jnareb@gmail.com> wrote:
> On Sat, 13 Sep 2008, Felipe Contreras wrote:
>> On Sat, Sep 13, 2008 at 12:45 PM, Jakub Narebski <jnareb@gmail.com> wrote:
>>> "Felipe Contreras" <felipe.contreras@gmail.com> writes:

<snip/>

>>>> After some RFCs on git and monotone mailing lists it seems now that
>>>> the script is going in the right direction.
>>>
>>> When you feel this script to be ready, could you add it to the
>>> "Interaction with other Revision Control Systems" section on
>>>  http://git.or.cz/gitwiki/InterfacesFrontendsAndTools
>>> As far as I can see there ain't any Monotone to Git converter on this
>>> list.
>>
>> Ok, done. I think it's ready if you can bare the slowness of the
>> 'checkout' method. The only missing feature is tags, but should be
>> easy to implement.
>
> Thank you.
>
> BTW. did you have any problems with (from what I understand) slightly
> different concept of branches between Monotone and Git?

Monotone can have multiple heads in one single branch, but from what I
understand that mostly happens locally (not on the published repo).
Anyway, If that happens the commits are still there, just dangling
temporarily in no branch.

There isn't much we can do for that situation, except maybe create
branch_n or something. I don't think it's a big problem.

-- 
Felipe Contreras


