Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4XJJ-0006O6-M7
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:10:33 +0200
Received: by iwn7 with SMTP id 7so663202iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=uSKM4mU6WGhXzmNwEvHZppZttqOStu9v1VFbY+vf934=;
	b=HDup6nT27xOYLvE5xxCZOPELjPi2giHFPRi782aLXi8cwY67Js5+2geroUQ5ofhNkn
	ICZKRt8IqkPPRAYi2QGQto8CoQhiFUbMi1LJgCGmRVAzR0TF6ZVHBJVZrqm/qlXa/d5/
	k1DAKcJ6Io53hp0wyr4u04OzgFdFaquWNaxas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PYLsrwa53aIk1dquXW7n59oFEqi5WDT9GkqqN8FhXqMHMVV2oQdP3mvEabR3ub8EqR
	JBV5idCOwXlracSiVx1ymEouHbFVy53FHADD2XbZefBGrTCfklczIS4nKHbG5Vd7qc5a
	VbunCLIHcJwbZh03UZNAvR1nxDpP6q7kO7L2M=
MIME-Version: 1.0
Received: by 10.231.12.139 with SMTP id x11mr3243497ibx.67.1286622569217; Sat,
	09 Oct 2010 04:09:29 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 04:09:29 -0700 (PDT)
In-Reply-To: <20101009103053.GA22759@rhein.zuhause.netz>
References: <1286612941.3831.24.camel@mattotaupa>
	<AANLkTi=x_-moOb3Xv02rVZkw3Uq5BhLjBFstbiqtZR1E@mail.gmail.com>
	<20101009103053.GA22759@rhein.zuhause.netz>
Date: Sat, 9 Oct 2010 13:09:29 +0200
Message-ID: <AANLkTinMdvqmmp6God5Y++QM_Ce+mvrhZr6N92y2ugmA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPENDS not honored: `do_configure` runs before `do_populate_sysroot` of dependencies
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
X-List-Received-Date: Sat, 09 Oct 2010 11:10:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/9 Henning Heinold <heinold@inf.fu-berlin.de>:
> On Sat, Oct 09, 2010 at 11:52:39AM +0200, Frans Meulenbroeks wrote:
>> +DEPENDS_virtclass-native_append = " tcl-native"
>
> Please dont quote the not so good solution and which later was superceeded by:
>
> DEPENDS_append_virtclass_native = " tcl-native"
>
>
Sorry yes you're right. I didn't copy from the later commit.

Still I don't understand why the original:
DEPENDS = "tcl-native ...
did not do the trick, whereas  DEPENDS_append_virtclass_native = "
tcl-native" does.

Frans.


