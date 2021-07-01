Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8708.1625152251190027445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 08:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=afy+8h+f;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id z4so3817854plg.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 08:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:references:from:organization:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ol4agdwyjFStWPj0yP0cRojAieeNH7ErUKBeM2L0NkQ=;
        b=afy+8h+fnF7lCZ718DRq2gKj7Z/wyF/5dj+Cz9/AYbd2nX78OmV/ks/SbDQ3FHka6s
         v6COvW0CL2uZcemqwr0KGVqi/WnoYujvBtlv2XGrnhq1eRPEXVd6cPqKZCjidocTxIsP
         c/sXH25SUvlJG5zEaWomR9Y8oE6fnDEx26Rv/5QKED0OSTOocJ5E/M2r861Bi1fT4PG3
         iAHdpTopfQWOpXfHDwsarA/XWLAiwxqRMDqIkNhPsyJAXb3nIAmMQHLO9LPxKl1LM2WJ
         enU1JoJGBq09msQtJ7X+rpoKOCGWDKPVJmGNh1UqCrLqzuTHwoVbOK+Kfsa9r/n63f+p
         MoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ol4agdwyjFStWPj0yP0cRojAieeNH7ErUKBeM2L0NkQ=;
        b=DZMjlfPI+GH/riv0KKORyCWtPTfSyn429jtIKFdY5yyY1S98/jcnyUoppVNvdXZzG5
         H8mNusaM03WEnKDB1P1l5wWSGSjuWyU+SxzTR7YtVkpvcIELfEao4OmcleKH8JUvDWwl
         x5/kqVWwAO3IRINfBRG4Izk2Mqod1An9v+jzxj9TVrKcHlFl6uLDYdcIp/pYRmc2lAwb
         h8DfrM/XnXY2vzZLdwAfhijyLh1FSVGrbvd/DT5vYwap1d+FknmXw/oifJVt7n0V4LUN
         kRTXOnVib6dzaNYbIAo+JkM4NBzvmhMG4OqJ5sEMjhvrdovCDJVR3+WVDTyxm/FSue/0
         Kd7Q==
X-Gm-Message-State: AOAM531YOWZ/3IkAFjdHtd7fGuv2YysoOvLaXiCJ6WqKtxV7ph+bSujQ
	U5zLcaEDruRv0Pj7N7xnuDNCO0+w3w30/g==
X-Google-Smtp-Source: ABdhPJycN1WFIEDcH/zYp3feKhTOGaFUrJx5gbQCu7Un8XyvLS52sEvYJYK0h6SVdq3eqA5TyF2xYg==
X-Received: by 2002:a17:902:c981:b029:129:afe:8e30 with SMTP id g1-20020a170902c981b02901290afe8e30mr125400plc.73.1625152250311;
        Thu, 01 Jul 2021 08:10:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:bda3:c742:f39c:c543? ([2601:646:9200:a0f0:bda3:c742:f39c:c543])
        by smtp.gmail.com with ESMTPSA id q12sm158054pgc.25.2021.07.01.08.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jul 2021 08:10:49 -0700 (PDT)
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1625121453-86858-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.17 -> 1.4.20
Message-ID: <ed7011ca-9b62-f611-d12d-31471159e97f@gmail.com>
Date: Thu, 1 Jul 2021 08:10:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625121453-86858-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/30/21 11:37 PM, zhengruoqin wrote:
> .. changelog::
>      :version: 1.4.20
>      :released: June 28, 2021
> 
>      .. change::
>          :tags: bug, regression, orm
>          :tickets: 6680
> 
>          Fixed regression in ORM regarding an internal reconstitution step for the
>          :func:`_orm.with_polymorphic` construct, when the user-facing object is
>          garbage collected as the query is processed. The reconstitution was not
>          ensuring the sub-entities for the "polymorphic" case were handled, leading
>          to an ``AttributeError``.
> 
>      .. change::
>          :tags: usecase, sql
>          :tickets: 6646
> 
>          Add a impl parameter to :class:`_types.PickleType` constructor, allowing
>          any arbitary type to be used in place of the default implementation of
>          :class:`_types.LargeBinary`. Pull request courtesy jason3gb.
> 
>      .. change::
>          :tags: bug, engine
>          :tickets: 5348
> 
>          Fixed an issue in the C extension for the :class:`_result.Row` class which
>          could lead to a memory leak in the unlikely case of a :class:`_result.Row`
>          object which referred to an ORM object that then was mutated to refer back
>          to the ``Row`` itself, creating a cycle. The Python C APIs for tracking GC
>          cycles has been added to the native :class:`_result.Row` implementation to
>          accommodate for this case.
> 
>      .. change::
>          :tags: bug, engine
>          :tickets: 6665
> 
>          Fixed old issue where a :func:`_sql.select()` made against the token "*",
>          which then yielded exactly one column, would fail to correctly organize the
>          ``cursor.description`` column name into the keys of the result object.
> 
>      .. change::
>          :tags: usecase, mysql
>          :tickets: 6659
> 
>          Made a small adjustment in the table reflection feature of the MySQL
>          dialect to accommodate for alternate MySQL-oriented databases such as TiDB
>          which include their own "comment" directives at the end of a constraint
>          directive within "CREATE TABLE" where the format doesn't have the
>          additional space character after the comment, in this case the TiDB
>          "clustered index" feature. Pull request courtesy Daniël van Eeden.
> 
>      .. change::
>          :tags: bug, schema
>          :tickets: 6685
> 
>          Fixed issue where passing ``None`` for the value of
>          :paramref:`_schema.Table.prefixes` would not store an empty list, but
>          rather the constant ``None``, which may be unexpected by third party
>          dialects. The issue is revealed by a usage in recent versions of Alembic
>          that are passing ``None`` for this value. Pull request courtesy Kai
>          Mueller.
> 
>      .. change::
>          :tags: bug, regression, ext
>          :tickets: 6679
> 
>          Fixed regression in :mod:`sqlalchemy.ext.automap` extension such that the
>          use case of creating an explicit mapped class to a table that is also the
>          :paramref:`_orm.relationship.secondary` element of a
>          :func:`_orm.relationship` that automap will be generating would emit the
>          "overlaps" warnings introduced in 1.4 and discussed at :ref:`error_qzyx`.
>          While generating this case from automap is still subject to the same
>          caveats that the "overlaps" warning refers towards, as automap is intended
>          for more ad-hoc use cases, the condition which produces the warning is
>          disabled when a many-to-many relationship with this particular pattern is
>          generated.
> 
>      .. change::
>          :tags: bug, regression, orm
>          :tickets: 6678
> 
>          Adjusted :meth:`_orm.Query.union` and similar set operations to be
>          correctly compatible with the new capabilities just added in
>          :ticket:`6661`, with SQLAlchemy 1.4.19, such that the SELECT statements
>          rendered as elements of the UNION or other set operation will include
>          directly mapped columns that are mapped as deferred; this both fixes a
>          regression involving unions with multiple levels of nesting that would
>          produce a column mismatch, and also allows the :func:`_orm.undefer` option
>          to be used at the top level of such a :class:`_orm.Query` without having to
>          apply the option to each of the elements within the UNION.
> 
>      .. change::
>          :tags: bug, sql, orm
>          :tickets: 6668
> 
>          Fixed the class hierarchy for the :class:`_schema.Sequence` and the more
>          general :class:`_schema.DefaultGenerator` base, as these are "executable"
>          as statements they need to include :class:`_sql.Executable` in their
>          hierarchy, not just :class:`_roles.StatementRole` as was applied
>          arbitrarily to :class:`_schema.Sequence` previously. The fix allows
>          :class:`_schema.Sequence` to work in all ``.execute()`` methods including
>          with :meth:`_orm.Session.execute` which was not working in the case that a
>          :meth:`_orm.SessionEvents.do_orm_execute` handler was also established.
> 
>      .. change::
>          :tags: bug, orm
>          :tickets: 6538
> 
>          Adjusted the check in the mapper for a callable object that is used as a
>          ``@validates`` validator function or a ``@reconstructor`` reconstruction
>          function, to check for "callable" more liberally such as to accommodate
>          objects based on fundamental attributes like ``__func__`` and
>          ``__call___``, rather than testing for ``MethodType`` / ``FunctionType``,
>          allowing things like cython functions to work properly. Pull request
>          courtesy Miłosz Stypiński.
> 

this patch does not apply cleanly

error: cannot convert from y to UTF-8
fatal: could not parse patch

so if you look at the patch mbox then you see this

Content-Type: text/plain; charset="y"
Content-Length: 6838
Content-Transfer-Encoding: quoted-printable

so I think it will be best to have a plain text commit msg perhaps thats 
the reason or something else I am not sure

So I have changed the commit msg details and staged in master-next 
please take a look and perhaps it will help if the commit msg is plain 
text I dont know.



> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   ...ython3-sqlalchemy_1.4.17.bb => python3-sqlalchemy_1.4.20.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.17.bb => python3-sqlalchemy_1.4.20.bb} (86%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
> rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
> index 5b881ea0b6..b96cdd3ed8 100644
> --- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.20.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
>   
> -SRC_URI[sha256sum] = "651cdb3adcee13624ba22d5ff3e96f91e16a115d2ca489ddc16a8e4c217e8509"
> +SRC_URI[sha256sum] = "38ee3a266afef2978e82824650457f70c5d74ec0cadec1b10fe5ed6f038eb5d0"
>   
>   PYPI_PACKAGE = "SQLAlchemy"
>   inherit pypi setuptools3
> 
> 
> 
> 
> 
