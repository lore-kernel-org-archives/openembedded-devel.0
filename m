Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RjGEn-0002Za-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 21:18:05 +0100
Received: by eaal1 with SMTP id l1so1258503eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 12:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+fW59a0qBRdX21QUZvG91sH+l/foZQ9KsVsNbtemB0g=;
	b=CFhgikuGyxZ4eyOwVGdvHKfhm/2CmzhiODWj4stlPTFkfH1KyjeuYtPhJ6vfhSFBJc
	sdnLDr6KNoyudhIQCvnYUKlpk5/8vWmvhWkCHHtDmdl1xrHMJKN5NC8H8YM+Ht2FEMwG
	EtLFFIi4hZqFzOCWfYmfty8387hdWadS9oNBU=
MIME-Version: 1.0
Received: by 10.205.136.205 with SMTP id il13mr3180849bkc.37.1325880640852;
	Fri, 06 Jan 2012 12:10:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.8.139 with HTTP; Fri, 6 Jan 2012 12:10:40 -0800 (PST)
In-Reply-To: <1325879877.3234.2.camel@lenovo.internal.reciva.com>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
Date: Fri, 6 Jan 2012 18:10:40 -0200
X-Google-Sender-Auth: F-kq-7UHAPBjQqumltTVYyLeDwU
Message-ID: <CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Fri, 06 Jan 2012 20:18:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 17:57, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2012-01-06 at 18:59 +0000, Otavio Salvador wrote:
> > +EXTRA_OECONF = "--disable-man-pages"
>
> why is this desirable?
>

Because it was breaking builds for me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

