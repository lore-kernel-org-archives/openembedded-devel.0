Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1N7rxY-0000Kp-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 15:44:43 +0100
Received: by fxm1 with SMTP id 1so78196fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 06:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZRThLt1T63dfFsufQS/ulwV4lf3IBWmzDeOWabO/koI=;
	b=hvSxI5kumbMbCdOp/faEM7s7E4boS7cHb/hFmxj1uAS0KymRE74egSxoLZ/cSeg59F
	vE7392KEmvxxumI0JGbyKQotyO4GITG72EfaP5JSYGUZw+Y/LlhBjugi7oOknyjmpxUL
	D3QkYkcw0+z1ZIV+YbsQaewkEU+VlROvVOwZA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rIYwhvc3I81iuxbiVTTsHpMHHgtcL301cKSbQ6N/g2orDz23vYjtx/PLQdX5K8X92Q
	5dgRGi3GOocU9x3pWitKAOZi/EfoArs3swNhu/7qQ+h7VaSKbjIXQzAFkYAzx4Eac7qn
	GTe/mzC/R1cnd3vUTi8G23HD/tUZYz99DtJcw=
MIME-Version: 1.0
Received: by 10.239.161.135 with SMTP id h7mr15065hbd.105.1257863749799; Tue, 
	10 Nov 2009 06:35:49 -0800 (PST)
In-Reply-To: <20091110132756.GC3998@excalibur.local>
References: <1257858446.3077.3.camel@opal>
	<20091110132756.GC3998@excalibur.local>
Date: Tue, 10 Nov 2009 15:35:49 +0100
Message-ID: <d2b9ea600911100635v67079116ifb3ba70b83177f13@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM: Summary of 'OE and Poky', 'Hosting', 'Bugtracker'
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
X-List-Received-Date: Tue, 10 Nov 2009 14:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 10, 2009 at 2:27 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Tue, 2009-11-10 at 14:07, Michael 'Mickey' Lauer wrote:
>>
>> We will do changes on the git layout, e.g. org.oe.dev is becoming
>> 'master'
>> and user branches will live in a seperate repository.
>
> While I can understand the former I can't see the reason for the later. Can you
> explain why that was decided?
>
> For me user and other topic branches worked well on the main repository. The
> only issue I have is the flood of commits on the commit ml when a branch gets
> rebased, but that is something that a filter in the commit mail hook should be
> able to solve.

Splitting out user branches into separate repository gives:

* option of giving developers access to push to user branches but not master
  branches

* git clone of master repository does not pull down all users objects

* namespace of master repository is not "polluted" by user branches.

Working with a master and a user repository should work just as well
as the current setup in all other aspects than having to do an (extra)
"git remote add" command.

/Esben


