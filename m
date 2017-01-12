Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 24D766FFFB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 17:39:32 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id a20so28302722qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 09:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9F0bDxlToJupOI0F8XrryLWCYKMZCHshqTDDIYIChDo=;
	b=JFDIpLstGgNmtmuM3gL/FrXOaKAbNYGQY6yViU9MSAMMki3sWGT9feUFAjO0TKvptI
	FFRpHH80T49SfX9koXyyvaeOAxkm7mEczmq5NCYB2QCQ9Vzjqa1du6GE8ChiyNzHcks4
	INmELZ8xxMnwbpOG3Ly2ds5pg17I57baUfbJgSEgZAgpIdJjvG2/3vR2NiB5G/ScEZU+
	EF5XzgTbyk0pocqfeSl1d7uVOge/HxD9wvjUXgMZY3sS/wevqe1j8xwzl9Liju/OcVLu
	UMMdK0n5hy8rgUvkzM19K7Zp3fVXeNECCz97lgZlOGQt1Z1Wb3/ej4o7PV4HEGe6qBEs
	UHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9F0bDxlToJupOI0F8XrryLWCYKMZCHshqTDDIYIChDo=;
	b=VZn0x0NTLbXZaMBe+jG8NSwqQGVRdNJ5/TNV4yfeIBsL4MstEmVzui0EtYJK00SUeg
	iOncC9ZiDVAChCzrdQHjWGZUBUNRhMhRlD2wdZ1az/A4KZnw9nHmdqk6ZCf5hYUHwWg5
	DxIaf8I/uv9GpG3GkFe5kP0aM7EqYSj3+7tQprtdU9chZqPwS1AiJ6yyo60LU4cdUxRv
	xLvsHMdml91X5wzH9hhVf9VwPABs4lARWkEWwq3uVxEx7xoT69pk0i22Y+mzI8xsDFf8
	6CczXBc70ZoW6r/MzkDBjAtth0BKvHfqEomVusR/KgQiDEgErFnBQ5y8ZGI5dw98is1p
	kq2w==
X-Gm-Message-State: AIkVDXI+kDk/C0OZ6ANGWAZti7LDQAETKNbEh5Yq/2ak50eIQaeTaBtJjybmkVaUPhfcGEiWYcRHPYHpZ8v0Dbpe
X-Received: by 10.55.47.4 with SMTP id v4mr14375011qkh.77.1484242773147; Thu,
	12 Jan 2017 09:39:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 09:39:12 -0800 (PST)
In-Reply-To: <bb9a299e3834488f8c033f7e07515afe@svr-orw-mbx-01.mgc.mentorg.com>
References: <c93f2baf-e05d-fc8a-0789-9651dc5a1fd4@balister.org>
	<2377449.YFeu6CDXkj@peggleto-mobl.ger.corp.intel.com>
	<bb9a299e3834488f8c033f7e07515afe@svr-orw-mbx-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 17:39:12 +0000
Message-ID: <CAJTo0LajcqeYxpN6HeKpAzwBReHq0Zp0QNd8w-mCy2vu9iuWKQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [yocto] OpenEmbedded Developers Meeting in Portland before ELC
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
X-List-Received-Date: Thu, 12 Jan 2017 17:39:33 -0000
Content-Type: text/plain; charset=UTF-8

On 12 January 2017 at 14:18, Hudson, Sean <Sean_Hudson@mentor.com> wrote:

>   It's a great point.  I have volunteered Mentor's teleconference, but the
> onsite pickup is always a challenge.  Once we've finalized the location,
> I'll focus on making sure that we have a high quality pickup(s) in the
> room.  If possible, I'll get a true video-conference setup.
>

Definitely plural!  A conference phone with a number of microphones dotted
around the room seems to be a sensible idea.

Ross

