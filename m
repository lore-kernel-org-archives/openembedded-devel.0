Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ExS-0001zB-Ee
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 03:33:02 +0200
Received: by yx-out-1718.google.com with SMTP id 36so700681yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2009 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qFIbsdtwAzP2hyhBfIBL6gxKLRVO8z9N8BHM6qD9icI=;
	b=QXepE8Kct+ht1AFw7zrKg6EZMveuQozysvsP3NS0obEBO3fTVyfYBbHhrmcPSJcDNl
	4+VV0vQfKQhbL6/CLHwH3/WG0xSbFEEmfmbZBGSZS/ZCgm09clZsSqOxSG8h4/8CxPoj
	ClZ1uPZIzT7u8c0yWVuTxeBg/WyD4NyOIEMjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VzczHX2YCi8gH0VXy/9Ov1Wfrdg6lM/4Eghv+CCza3bHo41d1f8oZINFsqu20klO4M
	/Qd7jHWaJuwgOHgvXRlOoVXqVwZErZ5s7B3ctGJg7ja9zeVx1d6KWNPm3gZ+lpfqisRt
	ojrLjl+R8NILPWHqn7N3+v1vGK9IayAU5pC6s=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.42.4 with SMTP id p4mr6952023anp.115.1241746013042; Thu, 
	07 May 2009 18:26:53 -0700 (PDT)
In-Reply-To: <f96d234e0905071713u17020e74v7e3cb68af7a2cc9@mail.gmail.com>
References: <be7a9f3d0905051001p5a933c2ds1c77b9b8afb75647@mail.gmail.com>
	<f96d234e0905071713u17020e74v7e3cb68af7a2cc9@mail.gmail.com>
Date: Thu, 7 May 2009 22:26:52 -0300
X-Google-Sender-Auth: b528056af4bffa22
Message-ID: <be7a9f3d0905071826o3e858e0asa7fa8b5e924f3d08@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Use of an INC_PR var when using a .inc file common to multiple recipes
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
X-List-Received-Date: Fri, 08 May 2009 01:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Cliff,

On Thu, May 7, 2009 at 9:13 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Tue, May 5, 2009 at 1:01 PM, Otavio Salvador <otavio@ossystems.com.br>=
 wrote:
>> Hello,
>>
>> I've been noticing how boring is to update .inc files that are used by
>> many recipes. It's also risky since we can easily forget to update a
>> required bb =A0file or, in worse case, a new bb can be included in the
>> overlay and it won't be updated with the changes done on the .inc
>> file.
>>
>> To solve it, I'd like to recommends the usage of the way I did for
>> firefox-l10n packages. I'm adding them just for reference.
>>
>> What people think about it?
>
> From a quick look, I assume you are meaning the way you did the PR?
[...]

Yes, I belive it helps to avoid useless work for all of us.

> I like it and added to: http://wiki.openembedded.net/index.php/Styleguide

Cool and thx! :-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


