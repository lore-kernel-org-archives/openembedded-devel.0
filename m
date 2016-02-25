Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8CA7722C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 09:27:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id 9so76797223iom.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 01:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4WT82xjRkhYlLrB34NAJQykocHWt9S3B8Y2Js/b3ubI=;
	b=jpIk/ZcD+1xW69JxwONXJkckq4R0vbAv+hnTkGNRzpheT/sjT5BxeGF3nsJQcB8fVB
	JcFgqhyJZJryxLZ0D9JU+p5HyrOLvg6c2DEYVqZ6netz8p3iGMsQFNJfh9qhxnlwGNOl
	KfYOgihiATbOyjmiHYM+98O+sAPpXA+DHnv/f5v35r0Q/vyPJphLuZeOUXPPNFPjZoIj
	Hqiq4mzUIP/7/8MU5Q3mzh/yyXdycJt7TRcQFloEgnk5drXsOk3f4OgjwXDW9jqbU5YV
	ZWm/Fg1xCbkBYL8sf6BVnPk1F01rs33yPovgh3Ke4cT05RUdeSV5CnvZzPhfj+2WtBy6
	JnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4WT82xjRkhYlLrB34NAJQykocHWt9S3B8Y2Js/b3ubI=;
	b=WjnZX3lOUjgEBgtf17XHhQfHqOYTTM57gYiKJH2b/QTk503dwt9CHFy8gS+Gv5JqZy
	TCgAGEREV5wkUqH1gcfLZKogccGJboZrMGV3uN1brroaYcwBeNzcmNIHFp0rrj7ZOGCK
	OFKewOq7pLMH3aLS+pcs2s+5el+pdKhQK5YuesXjn4D83dBcSbD73QsDZ9fpjOHJFRqq
	2Hpsxo9t5N0ubZgf17vCU2GFZYQmINySq8nxlp/5eQ+6D6PR30rjcSEiDemMSWU5mZnb
	M7QzcEB5mKq1cfrJatdtWFVqp+yrPDzJYBfB+PZjsWBKnSd3xsCne9vDcfz2YcHQ4gOa
	A2dA==
X-Gm-Message-State: AG10YOTmIC+SVPeVHxMAiS1sTzhk13PHiyLW6kT9w4S6h9i5YQy2GebhZpPuG7NK0AemOwfxaT09f6tfkBRfmoGU
X-Received: by 10.107.3.220 with SMTP id e89mr1851111ioi.99.1456392453766;
	Thu, 25 Feb 2016 01:27:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 01:27:14 -0800 (PST)
In-Reply-To: <1456148220.2298.25.camel@linux.intel.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
	<ccea554cd4fef5dcffc2e9edfb69a8b606907716.1455895912.git.adrian.ratiu@ni.com>
	<1456148220.2298.25.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 09:27:14 +0000
Message-ID: <CAJTo0LaDXv6D470Za-tVobw5idYc6F4qET4wLcmFCKYV04k-OA@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, 
	Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v6 2/4] gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
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
X-List-Received-Date: Thu, 25 Feb 2016 09:27:33 -0000
Content-Type: text/plain; charset=UTF-8

On 22 February 2016 at 13:37, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> As far as I can tell get_gpg_version returns a string. However, you
> compare that with a float. This should give more correct behavior:
> +        if gpg_ver > "2.1":
>

Not sure I'd trust that either, version comparison logic is painful.
Something like this might be more resilient to interesting versioning:

dots = versionstring.split('.')
assert len(dots) >2
if int(dots[0]) >= 2 and int(dots[1])>= 1:

Also:

+        job = subprocess.Popen([self.gpg_bin, "--version"],
stdout=subprocess.PIPE)
+        (stdout, _) = job.communicate()
+
+        if job.returncode:
+            raise bb.build.FuncFailed("Could not get gpg version (is %s
installed?)" %
+                                      self.gpg_bin)
+        return stdout.split()[2]

That's a long-winded way of saying:

try:
    return subprocess.check_output((self.gpg_bin, "version")).split()[2]
except CalledProcessExceptionOrWhateverThisExceptionIsCalled:
    raise bb.build.FuncFailed("Could not get gpg version (%s). Called %s,
output %s" % (e, e.cmd, e.output))

Ross

