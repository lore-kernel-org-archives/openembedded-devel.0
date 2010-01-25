Received: from mail-iw0-f197.google.com ([209.85.223.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NZJT6-0003Jt-Lb
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 08:34:44 +0100
Received: by iwn35 with SMTP id 35so1056392iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 23:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+xlKqxFhdcPMTy6zsdTtaXedKcivlx3hYLlB+pcDOVQ=;
	b=QPFACvW3/hjH719IaTlRNZAROWVfsfuW1Ti0DnjIiWUGCBxXVOAbMbk7cVTqH91bPA
	ND3UeS8NPJH7xYhel5OV/P6aAomgz5pHfVKqwxrqE3RxPC9FlRByQMDdkeYJmWTemHuS
	SG1YJ4W7qBGkpKA54LH6hGNGKDyckvT0jyZkA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EmV9LIuCPDqsN3O0VjDnzMfIKzZEQSYPVbT21j3Jgg0YyOE/GpycQQMwE7czhpFaPV
	aNJcaRilZhsr/CCblZZU1guI+45MR8JRakpaxP1C0KZKVNuSkVbW95775FaySAt+zjwQ
	nSR0mzpAKF3ATbyAU1b4dOUdTzYbQ011jXDr0=
MIME-Version: 1.0
Received: by 10.231.159.129 with SMTP id j1mr3547495ibx.81.1264404740044; Sun, 
	24 Jan 2010 23:32:20 -0800 (PST)
In-Reply-To: <1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
References: <4B584F62.1050406@balister.org>
	<1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Sun, 24 Jan 2010 23:32:19 -0800
Message-ID: <19c1b8a91001242332h3136da60m76bfdd02ae1aa1fb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using `git send-email` (was: Number 1 tip for getting your patch committed)
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
X-List-Received-Date: Mon, 25 Jan 2010 07:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2010 at 2:06 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> [Sorry guys for spamming the list with my messages. But I want to get my
> questions out to you so that I can scratch it from my list.]
>
>
> Am Donnerstag, den 21.01.2010, 07:58 -0500 schrieb Philip Balister:
>> Follow the commit log message policy at:
>>
>> http://wiki.openembedded.net/index.php/Commit_log_example
>>
>> and use git send-email to send the patch to the list. If you do this, it
>> makes the act of retrieving the patch from patchwork trivial (see
>> contrib/patchwprk/pw-am.sh).
>>
>> This leaves you in a position where you can discuss the patch with
>> someone with commit access and they can easily apply and push the patch.
>
> I have two problems with this.
>
> Firstly using `git send-email` is nowhere mentioned in the commit policy
> [1].
>
> Secondly for a lot of people using `git send-email` is no option because
> setup is too difficult, their MUA does not integrate well with `git
> send-email` so the address book is not available, they do want to have
> sent messages archived in their Sent folder, they want to ask some
> questions regarding the patch and therefore need to write a message and
> attach it.

all can be achieved with git send-email you need to add
[sendemail]
        to =3D openembedded-devel@lists.openembedded.org

to openembedded/.git/config and you dont have to type in to
address everytime you send patch and if you have proper Sign-offs then
it CC the mail to people in Signed-off-by too.

but I do agree some people might want to use other mail clients
I would say than to follow the guidelines mentioned in linux kernel
project for various email clients Documentation/
email-clients.txt


>
> In my opinion we should therefore find a way to also work easily with
> attached patches having been created with `git format-patch`. Can some
> of the developers mention what the disadvantage of attached patches is.
> You can easily quote them to and saving and applying should be as easy
> as with messages sent using `git send-email`.
>
> The only disadvantage I can think of seems to be that it is not
> displayed in the mailing list archive.
>
> And of course that it is not easy to retrieve them from Patchwork. If
> that is the only obstacle I would try to contact the Patchwork hackers
> and ask them to implement an option to retrieve the attachment if it has
> for example the extension =BBpatch=AB or =BBdiff=AB.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://wiki.openembedded.net/index.php/Commit_Policy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


