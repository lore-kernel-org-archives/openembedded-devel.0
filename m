Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TqiFP-0003SB-2S
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 11:42:03 +0100
Received: from mail-ye0-f200.google.com ([209.85.213.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 02:26:57 -0800
Received: by mail-ye0-f200.google.com with SMTP id r13so23200692yen.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 02:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=1NHNACpDgAkBdPy+GKNZ+iUceK0+5detJ/fL5w096Bk=;
	b=fygOkQwIzPWqO40JwkUnXwOWRDo0xO1QRX9M50s7w0PipnvG/iAWirMhx8scoHX2Vv
	BbrLqwcMOzsIFGUzHzYAi9CY6RX+zEtWGaeYvwiNjPox4G8kWN+VKJb6dCh9Gxcs+Fr7
	OR0uDTsEqm4zWlqYfc0vI/AuKDmJo1U9E4NyJVexD7pM1ZBU9eOatXN61gmTN0Ou0f2W
	6fFiLfGLx2gBs8HdnlKE5Nna7b69Wf8taWqcuvtLgHtcpguvAjoWDa23ILzPBqZGIQpO
	3KvzLP5CEZ5NShrYaih0x+xwbhhHN0x9qHo99NM3B5YBxhdg34Fl1D8A1ae+5QobSXXv
	I2wg==
X-Received: by 10.52.66.71 with SMTP id d7mr63959336vdt.121.1357208817029;
	Thu, 03 Jan 2013 02:26:57 -0800 (PST)
Received: by 10.52.66.71 with SMTP id d7mr63959331vdt.121.1357208816933; Thu,
	03 Jan 2013 02:26:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 3 Jan 2013 02:26:35 -0800 (PST)
In-Reply-To: <1494272.pND5Ntq0Hj@helios>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
	<1494272.pND5Ntq0Hj@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2013 10:26:35 +0000
Message-ID: <CAJTo0LZNprjMsqdVH=xzcr_0TtJ1o9BF2sAjYyYJzViHw6Smvg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmPmtMJXNrebxLqFKuR5MhagAjF7d/yq1aPlXOdiYy1llEtgg/U1mKbyt+ltFs1tMX4aLnhH9jfp1mfL3qw+gLuGvQJ95/PFlSWRC61AGt8vuTY7WNuph1shMJlyDQqQgLIcH44BA6D8FxpJ07U4cqppo32j7oVXsBJJ6pqTL73jDVzWUC2krisNqoklnWS37gnEUEh
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia PATCH V2 1/6] gssdp: add 0.12.2.1 and 0.13.2
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
X-List-Received-Date: Thu, 03 Jan 2013 10:42:03 -0000
Content-Type: text/plain; charset=UTF-8

On 23 December 2012 19:44, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Friday 21 December 2012 13:43:37 Ross Burton wrote:
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Why both versions?

GUPnP uses the GNOME-style stable/development even/odd versioning so
there's value in having both.  Specifically, dLeyna requires the
current development releases as that's where several critical bug
fixes have landed (ideally those fixes would be pushed to the stable
series, but I'm not in a position to suggest that anymore).

Ross


